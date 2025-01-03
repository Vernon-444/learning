import requests
from bs4 import BeautifulSoup
import json
import time
import random
from tqdm import tqdm

# List of course URLs to scrape
course_urls = [
    'https://www.dgcoursereview.com/courses/maple-hill-dgc.119/',
    'https://www.dgcoursereview.com/courses/eagles-crossing.12414/'
]

# Function to scrape course stats
def scrape_course_stats(course_url):
    response = requests.get(course_url)
    if response.status_code == 200:
        soup = BeautifulSoup(response.content, 'html.parser')
        
        # Extract course name
        course_name = soup.find('h1', class_='c-course-info-title').text.strip()
        
        # Extract city and state
        location_span = soup.find('span', class_='c-course-info-location')
        city = location_span.contents[0].strip().rstrip(',')
        state = location_span.find('a').text.strip()
        
        # Extract course stats
        stats_div = soup.find('div', class_='c-course-stats')
        if stats_div:
            distance_range = stats_div.find_all('span', class_='dg_unit')
            elevation = stats_div.find_all('div', class_='c-course-stat')[1].text.strip()
            forestation = stats_div.find_all('div', class_='c-course-stat')[2].text.strip()
            num_holes = stats_div.find('span', class_='_holes').text.strip()
            num_baskets = stats_div.find('span', class_='_baskets').text.strip()
            hazards = stats_div.find('span', class_='_water').text.strip()
            hazards_type = stats_div.find('span', class_='c-course-stat-label').text.strip()
            
            course_stats = {
                'name': course_name,
                'city': city,
                'state': state,
                'distance_range': f"{distance_range[0]['data-feet']} ft - {distance_range[1]['data-feet']} ft",
                'elevation': elevation,
                'forestation': forestation,
                'num_holes': num_holes,
                'num_baskets': num_baskets,
                'hazards': hazards,
                'hazards_type': hazards_type
            }
            
            return course_stats
    else:
        print(f'Failed to retrieve the course page. Status code: {response.status_code}')
        return None

# Function to scrape course holes data
def scrape_course_holes(course_url):
    response = requests.get(course_url + 'holes')
    if response.status_code == 200:
        soup = BeautifulSoup(response.content, 'html.parser')
        
        # Simulate clicking the "Expand AllPin Positions" anchor by modifying the HTML content
        for expand_anchor in soup.find_all('a', {'data-xf-click': 'hole-expandable'}):
            expand_anchor['class'] = expand_anchor.get('class', []) + ['_active']
        
        # Extract the tee pad locations
        tee_pads = []
        for th in soup.select('tr[data-group="all"] th'):
            color_div = th.find('div', class_='_mark')
            if color_div:
                color = color_div['style'].split(':')[1].strip(';')
                tee_pads.append(color)
        
        # Extract hole information
        holes = []
        for hole_row in soup.select('tr[data-group]'):
            hole_info = {}
            hole_span = hole_row.find('span', class_='_hole')
            if hole_span:
                hole_info['hole'] = hole_span.text.strip()
                hole_info['active'] = True
            
                tee_pads_data = {}
                for idx, td in enumerate(hole_row.find_all('td')[2:], start=0):
                    distance_span = td.find('span', class_='dg_unit')
                    if distance_span:
                        distance = distance_span['data-feet']
                        par = td.find('sup').text.strip('()')
                        tee_pads_data[tee_pads[idx]] = {
                            'active_position': None,  # Placeholder, will be updated later
                            'pin_positions': {}
                        }
                        tee_pads_data[tee_pads[idx]]['pin_positions']['Active'] = {
                            'distance': distance,
                            'par': par
                        }
                
                hole_info['tee_pads'] = tee_pads_data
                holes.append(hole_info)
        
        # Extract pin positions
        for pin_row in soup.select('tr._collapsible'):
            pin_position = pin_row.find('span').text.strip()
            hole_number = pin_row['data-group']
            
            for hole in holes:
                if hole['hole'].endswith(hole_number):
                    for idx, td in enumerate(pin_row.find_all('td')[2:], start=0):
                        distance_span = td.find('span', class_='dg_unit')
                        if distance_span:
                            distance = distance_span['data-feet']
                            par = td.find('sup').text.strip('()')
                            tee_pad = tee_pads[idx]
                            hole['tee_pads'][tee_pad]['pin_positions'][pin_position] = {
                                'distance': distance,
                                'par': par
                            }
                            if hole['tee_pads'][tee_pad]['active_position'] is None:
                                hole['tee_pads'][tee_pad]['active_position'] = pin_position
        
        return holes
    else:
        print(f'Failed to retrieve the course holes page. Status code: {response.status_code}')
        return None

# Main script to scrape all courses
all_courses_data = []
for course_id, course_url in enumerate(tqdm(course_urls, desc="Scraping courses"), start=1):
    course_stats = scrape_course_stats(course_url)
    course_holes = scrape_course_holes(course_url)
    
    if course_stats and course_holes:
        course_data = {
            'id': course_id,
            'name': course_stats['name'],
            'city': course_stats['city'],
            'state': course_stats['state'],
            'stats': course_stats,
            'holes': course_holes
        }
        all_courses_data.append(course_data)
    
    time.sleep(random.uniform(5, 10))  # Sleep to limit the rate of requests

# Save the data to a JSON file
with open('all_courses_data.json', 'w') as json_file:
    json.dump(all_courses_data, json_file, indent=4)

print('Data extraction complete.')
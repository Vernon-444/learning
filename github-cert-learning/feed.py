import yaml
import xml.etree.ElementTree as xml_tree

with open('feed.yaml', 'r') as file:
    yaml_data = yaml.safe_load(file)

    rss_element = xml_tree.Element('rss', {
        'version':'2.0',
        'xmlns:itunes':'http://www.itunes.com/dtds/podcast-1.0.dtd',
        'xmlns:content':'http://purl.org/rss/1.0/modules/content/'})
    
channel_element = xml_tree.SubElement(rss_element, 'channel')

link_prefix = yaml_data['link']

xml_tree.SubElement(channel_element, 'title').text = yaml_data['title']


xml_tree.SubElement(channel_element, 'link').text = 'https://www.apple.com/itunes/podcasts/'
xml_tree.SubElement(channel_element, 'language').text = 'en-us'
xml_tree.SubElement(channel_element, 'copyright').text = '© 2020 John SampleText'
xml_tree.SubElement(channel_element, 'itunes:author').text = 'The Sunset Explorers'
xml_tree.SubElement(channel_element, 'description').text = (
    "Love to get outdoors and discover nature's treasures? Hiking Treks is the "
    "show for you. We review hikes and excursions, review outdoor gear and interview "
    "a variety of naturalists and adventurers. Look for new episodes each week."
)
xml_tree.SubElement(channel_element, 'itunes:type').text = 'serial'
xml_tree.SubElement(channel_element, 'itunes:image', {'href': link_prefix + yaml_data['image']})
category_element = xml_tree.SubElement(channel_element, 'itunes:category', text="Sports")
xml_tree.SubElement(category_element, 'itunes:category', text="Wilderness")
xml_tree.SubElement(channel_element, 'itunes:explicit').text = 'false'
xml_tree.SubElement(channel_element, 'link').text = link_prefix

# Add items
items = [
    {
        'episodeType': 'trailer',
        'title': 'Hiking Treks Trailer',
        'description': (
            "The Sunset Explorers share tips, techniques and recommendations for "
            "great hikes and adventures around the United States. Listen on "
            "<a href=\"https://www.apple.com/itunes/podcasts/\">Apple Podcasts</a>."
        ),
        'enclosure': {
            'length': '498537',
            'type': 'audio/mpeg',
            'url': 'http://example.com/podcasts/everything/AllAboutEverythingEpisode4.mp3'
        },
        'guid': 'D03EEC9B-B1B4-475B-92C8-54F853FA2A22',
        'pubDate': 'Tue, 8 Jan 2019 01:15:00 GMT',
        'duration': '1079',
        'explicit': 'false'
    },
    # Add other items here...
]

for item in yaml_data['item']:
    item_element = xml_tree.SubElement(channel_element, 'item')
    xml_tree.SubElement(item_element, 'title').text = item['title']
    xml_tree.SubElement(item_element, 'itunes:author').text = yaml_data['author']
    xml_tree.SubElement(item_element, 'description').text = item['description']
    xml_tree.SubElement(item_element, 'itunes:duration').text = item['duration']
    xml_tree.SubElement(item_element, 'pubDate').text = item['published']


    enclosure = xml_tree.SubElement(item_element, 'enclosure', {
        'url': link_prefix + item['file'],
        'type': 'audio/mpeg',
        'length': item['length'],
    })
    

output_tree = xml_tree.ElementTree(rss_element)
output_tree.write('podcast.xml', encoding="UTF-8", xml_declaration=True)

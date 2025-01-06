# Data Fetch Script

This directory contains a Python script (`data_fetch.py`) that fetches data from the web, processes it, and saves it in a desired format.

## Dependencies

The script requires the following Python libraries:
- `requests`
- `beautifulsoup4`
- `tqdm`

These dependencies are listed in the `requirements.txt` file.

## Installation

To install the required dependencies, follow these steps:

1. **Create a virtual environment (optional but recommended)**:
   ```sh
   python3 -m venv venv
   source venv/bin/activate
   ```

2. **Install the dependencies**:
    ```sh
    pip install -r requirements.txt
    ```

## Usage:
To run the `data_fetch.py` script use the following command:
    ```sh
    python3 data_fetch.py
    ```

### Description of the Script
The data_fetch.py script performs the following tasks:

Fetches data from specified URLs using the requests library.
Parses the HTML content using BeautifulSoup.
Processes the data and saves it in a desired format (e.g., JSON).
Uses tqdm to display a progress bar for long-running operations.
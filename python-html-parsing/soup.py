#!/usr/bin/env python3

from bs4 import BeautifulSoup

with open('sample.html', 'r') as file:
    html_content = file.read()

# Parse the HTML with BeautifulSoup
soup = BeautifulSoup(html_content, 'html.parser')

for img in soup.find_all('img'):
    print(img.get('src'))

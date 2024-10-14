import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin
from django.core.paginator import Paginator
from django.shortcuts import render
from django.http import HttpResponse
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time
import csv

def scrape_articles(request):
    base_url = 'https://plniconplus.co.id/e-proc/'
    total_articles = []
    articles_per_page = 20  # Number of articles per page

    # Fetch articles from all pages
    page_number = 1
    while True:
        url = f"{base_url}page/{page_number}/" if page_number > 1 else base_url
        response = requests.get(url)

        if response.status_code != 200:
            break  # Stop if no more pages are available

        soup = BeautifulSoup(response.text, 'html.parser')
        post_list = soup.select_one('.post-list')

        if post_list:
            # Get all h3 elements for unique articles
            for item in post_list.find_all('article'):  # Assuming each article is wrapped in an <article> tag
                title = item.find('h3').text.strip()
                link = item.find('a')['href']
                full_link = urljoin(base_url, link)

                # Extract post date - Adjust the selector as per the site's structure
                post_date = item.find(class_='post__date').text.strip() if item.find(class_='post__date') else 'No date available'

                # Ensure no duplicate articles
                if full_link not in [article['link'] for article in total_articles]:
                    total_articles.append({'title': title, 'link': full_link, 'post_date': post_date})
        else:
            break  # Stop if no content found

        page_number += 1  # Go to the next page

    # Check if the request is for CSV download
    if request.GET.get('download') == 'csv':
        response = HttpResponse(content_type='text/csv')
        response['Content-Disposition'] = 'attachment; filename="articles.csv"'

        writer = csv.writer(response)
        writer.writerow(['Title', 'Link', 'Post Date'])  # Write CSV header

        for article in total_articles:
            writer.writerow([article['title'], article['link'], article['post_date']])  # Write each article

        return response  # Return the CSV response

    # Create paginator
    paginator = Paginator(total_articles, articles_per_page)  # 20 articles per page
    page_number = request.GET.get('page')  # Get page number from query parameter
    articles_page = paginator.get_page(page_number)  # Get articles for the page

    return render(request, 'scrapper/pln_icon_plus.html', {'articles': articles_page})


# Scraping function for LPSE LKPP with Selenium (Headless)
def lelang_lkpp(request):
    options = Options()
    options.headless = True
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-dev-shm-usage')
    options.add_argument("user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36")

    driver = webdriver.Chrome(options=options)
    driver.get('https://lpse.lkpp.go.id/eproc4/lelang')

    # Wait for the page to load
    WebDriverWait(driver, 100).until(
        EC.presence_of_element_located((By.ID, 'tbllelang_wrapper'))
    )

    lelang_data = []
    # Use By.ID instead of find_element_by_id
    while True:
        try:
            # Find table on the page
            table = driver.find_element(By.ID, 'tbllelang_wrapper')
            rows = table.find_elements(By.TAG_NAME, 'tr')

            # Extract data from each row
            for row in rows[1:]:  # Skip the header row
                cols = row.find_elements(By.TAG_NAME, 'td')
                cols = [col.text.strip() for col in cols]

                if len(cols) > 0:
                    lelang_data.append({
                        'kode_lelang': cols[0] if len(cols) > 0 else '',
                        'nama_paket': cols[1] if len(cols) > 1 else '',
                        'link': row.find_element(By.TAG_NAME, 'a').get_attribute('href') if len(cols) > 1 else '',
                        'instansi': cols[2] if len(cols) > 2 else '',
                        'tahapan': cols[3] if len(cols) > 3 else '',
                        'hps': cols[4] if len(cols) > 4 else '',
                    })
             # Wait for the pagination section to load
            WebDriverWait(driver, 100).until(
                EC.presence_of_element_located((By.ID, 'tbllelang_paginate'))
            )

            # Check for pagination
            pagination = driver.find_element(By.ID, 'tbllelang_paginate')
            next_button = pagination.find_element(By.LINK_TEXT, 'Berikutnya')

            if next_button:
                next_button.click()  # Click the "Next" button
                time.sleep(3)  # Wait for the page to load
            else:
                break  # No more pages

        except Exception as e:
            print(f"Error: {e}")
            break

    driver.quit()

    paginator = Paginator(lelang_data, 6)  # 6 items per page
    page_number = request.GET.get('page')
    lelang_data = paginator.get_page(page_number)

    return render(request, 'scrapper/lelang_lkpp.html', {'lkpp_lelang': lelang_data})


def home_page(request):
    return render(request, 'scrapper/home.html')

import requests
from bs4 import BeautifulSoup
from .models import Article
from .models import Lelang
from urllib.parse import urljoin
from django.core.paginator import Paginator
from django.shortcuts import render
from django.http import HttpResponse
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
import threading
import random
import time
import csv


# Define a function to handle the scraping in a separate thread
def scrape_data():
    base_url = 'https://plniconplus.co.id/e-proc/'
    total_articles = []
    articles_per_page = 20  # Number of articles per page

    # Cek apakah ada data di database
    articles_in_db = Article.objects.all()

    if articles_in_db.exists():
        for article in articles_in_db:
            total_articles.append({'title': article.title, 'link': article.link, 'post_date': article.post_date})

    page_number = 1
    while True:
        url = f"{base_url}page/{page_number}/" if page_number > 1 else base_url
        response = requests.get(url)

        if response.status_code != 200:
            break

        soup = BeautifulSoup(response.text, 'html.parser')
        post_list = soup.select_one('.post-list')

        if post_list:
            for item in post_list.find_all('article'):
                title = item.find('h3').text.strip()
                link = item.find('a')['href']
                full_link = urljoin(base_url, link)
                post_date = item.find(class_='post__date').text.strip() if item.find(class_='post__date') else 'No date available'

                if not Article.objects.filter(link=full_link).exists():
                    new_article = Article(title=title, link=full_link, post_date=post_date)
                    new_article.save()
                    total_articles.append({'title': title, 'link': full_link, 'post_date': post_date})
                else:
                    total_articles.append({'title': title, 'link': full_link, 'post_date': post_date})
        else:
            break

        page_number += 1

    # Here you can implement additional logic to handle the total_articles list,
    # for example, saving them to the database or logging.

def scrape_articles(request):
    # Start the scraping in a separate thread
    scraping_thread = threading.Thread(target=scrape_data)
    scraping_thread.start()

    # Prepare the articles for rendering
    total_articles = []
    articles_per_page = 20  # Number of articles per page

    articles_in_db = Article.objects.all()
    if articles_in_db.exists():
        for article in articles_in_db:
            total_articles.append({'title': article.title, 'link': article.link, 'post_date': article.post_date})

    # Check if the request is for CSV download
    if request.GET.get('download') == 'csv':
        response = HttpResponse(content_type='text/csv')
        response['Content-Disposition'] = 'attachment; filename="articles.csv"'

        writer = csv.writer(response)
        writer.writerow(['Title', 'Link', 'Post Date'])  # Write CSV header

        for article in total_articles:
            writer.writerow([article['title'], article['link'], article['post_date']])

        return response  # Return the CSV response

    # Create paginator
    paginator = Paginator(total_articles, articles_per_page)
    page_number = request.GET.get('page')
    articles_page = paginator.get_page(page_number)

    return render(request, 'scrapper/pln_icon_plus.html', {'articles': articles_page})


# Scraping function for LPSE LKPP with Selenium (Headless)
def scrape_data_lpse():
    # Kode scraping yang sama seperti sebelumnya
    options = Options()
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-dev-shm-usage')

    user_agents = [
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36",
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0"
    ]
    options.add_argument(f"user-agent={random.choice(user_agents)}")
    driver = webdriver.Chrome(options=options)
    driver.get('https://lpse.lkpp.go.id/eproc4/lelang')
    time.sleep(random.uniform(3, 5))

    lelang_data = []
    while True:
        try:
            table = driver.find_element(By.ID, 'tbllelang_wrapper')
            rows = table.find_elements(By.TAG_NAME, 'tr')

            for row in rows[1:]:
                cols = row.find_elements(By.TAG_NAME, 'td')
                cols = [col.text.strip() for col in cols]

                if len(cols) > 0:
                    lelang_data.append({
                        'kode_lelang': cols[0],
                        'nama_paket': cols[1],
                        'link': row.find_element(By.TAG_NAME, 'a').get_attribute('href'),
                        'instansi': cols[2],
                        'tahapan': cols[3],
                        'hps': cols[4],
                    })

            pagination = driver.find_element(By.ID, 'tbllelang_paginate')
            next_button = pagination.find_element(By.LINK_TEXT, 'Berikutnya')

            if next_button:
                webdriver.ActionChains(driver).move_to_element(next_button).perform()
                next_button.click()
                time.sleep(random.uniform(2, 4))
            else:
                break

        except Exception as e:
            print(f"Error: {e}")
            break

    driver.quit()

    # Simpan atau update data ke database
    for item in lelang_data:
        Lelang.objects.update_or_create(
            kode_lelang=item['kode_lelang'],
            defaults={
                'nama_paket': item['nama_paket'],
                'link': item['link'],
                'instansi': item['instansi'],
                'tahapan': item['tahapan'],
                'hps': item['hps'],
            }
        )


def lelang_lkpp(request):
    # Ambil data dari database
    lelang_data = Lelang.objects.all()

    if not lelang_data.exists():
        # Jika tidak ada data, mulai scraping
        threading.Thread(target=scrape_data_lpse).start()
    else:
        # Jika ada data, tampilkan terlebih dahulu
        paginator = Paginator(lelang_data, 6)
        page_number = request.GET.get('page')
        lelang_data = paginator.get_page(page_number)
        # Mulai scraping di background
        threading.Thread(target=scrape_data_lpse).start()

    return render(request, 'scrapper/lelang_lkpp.html', {'lkpp_lelang': lelang_data})


def home_page(request):
    return render(request, 'scrapper/home.html')

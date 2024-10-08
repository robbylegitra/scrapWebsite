import requests
from bs4 import BeautifulSoup
from django.shortcuts import render


def scrape_articles(request):
    base_url = 'https://plniconplus.co.id/e-proc/'
    articles = []
    page_number = 1
    max_pages = 5  # Atur jumlah halaman yang ingin diambil

    while page_number <= max_pages:
        url = f"{base_url}?page={page_number}"
        response = requests.get(url)

        if response.status_code != 200:
            break  # Berhenti jika tidak ada lagi halaman yang tersedia

        soup = BeautifulSoup(response.text, 'html.parser')
        post_list = soup.select_one('.post-list')

        if not post_list:
            break  # Berhenti jika tidak ada post-list

        # Mengambil semua elemen h3
        for item in post_list.find_all('h3'):
            title = item.text.strip()
            link = item.find('a')['href']
            articles.append({'title': title, 'link': link})

        page_number += 1  # Naik ke halaman berikutnya

    return render(request, 'scrapper/index.html', {'articles': articles})

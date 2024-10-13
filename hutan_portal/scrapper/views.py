import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin
from django.core.paginator import Paginator
from django.shortcuts import render
from django.http import HttpResponse
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
            for item in post_list.find_all('h3'):
                title = item.text.strip()
                link = item.find('a')['href']
                full_link = urljoin(base_url, link)
                # Ensure no duplicate articles
                if full_link not in [article['link'] for article in total_articles]:
                    total_articles.append({'title': title, 'link': full_link})
        else:
            break  # Stop if no content found

        page_number += 1  # Go to the next page

    # Check if the request is for CSV download
    if request.GET.get('download') == 'csv':
        response = HttpResponse(content_type='text/csv')
        response['Content-Disposition'] = 'attachment; filename="articles.csv"'

        writer = csv.writer(response)
        writer.writerow(['Title', 'Link'])  # Write CSV header

        for article in total_articles:
            writer.writerow([article['title'], article['link']])  # Write each article

        return response  # Return the CSV response

    # Create paginator
    paginator = Paginator(total_articles, articles_per_page)  # 20 articles per page
    page_number = request.GET.get('page')  # Get page number from query parameter
    articles_page = paginator.get_page(page_number)  # Get articles for the page

    return render(request, 'scrapper/index.html', {'articles': articles_page})

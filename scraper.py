# var cheerio = require("cheerio"),
#     request = require("request");

# request("http://localhost/file.html", function(err, res, data) {
#   var $ = cheerio.load(data);

#   var people = $('table.person');
#   var results = [];

#   $.each(people, function() {
#     var $this = $(this);

#     results.push({ 
#       firstName: $this.find('.firstName').text(),
#       lastName: $this.find('.lastName').text(),
#       age: $this.find('.age').text()
#     });
#   }

#   do_something_with(results);
# });




import scrapy


class QuotesSpider(scrapy.Spider):
    name = "quotes"

    def start_requests(self):
        url = 'http://quotes.toscrape.com/'
        tag = getattr(self, 'tag', None)
        if tag is not None:
            url = url + 'tag/' + tag
        yield scrapy.Request(url, self.parse)

    def parse(self, response):
        for quote in response.css('div.quote'):
            yield {
                'text': quote.css('span.text::text').extract_first(),
                'author': quote.css('span small a::text').extract_first(),
            }

        next_page = response.css('li.next a::attr(href)').extract_first()
        if next_page is not None:
            next_page = response.urljoin(next_page)
            yield scrapy.Request(next_page, self.parse)













import urllib2
from bs4 import BeautifulSoup

main_url = "http://www.example.com"

main_page_html  = tryAgain(main_url)
main_page_soup = BeautifulSoup(main_page_html)

# Scrape all TDs from TRs inside Table
for tr in main_page_soup.select("table.class_of_table"):
   for td in tr.select("td#id"):
       print(td.text)
       # For acnhors inside TD
       print(td.select("a")[0].text)
       # Value of Href attribute
       print(td.select("a")[0]["href"])

# This is method that scrape URL and if it doesnt get scraped, waits for 20 seconds and then tries again. (I use it because my internet connection sometimes get disconnects)
def tryAgain(passed_url):
    try:
        page  = requests.get(passed_url,headers = random.choice(header), timeout = timeout_time).text
        return page
    except Exception:
        while 1:
            print("Trying again the URL:")
            print(passed_url)
            try:
                page  = requests.get(passed_url,headers = random.choice(header), timeout = timeout_time).text
                print("-------------------------------------")
                print("---- URL was successfully scraped ---")
                print("-------------------------------------")
                return page
            except Exception:
                time.sleep(20)
                continue 
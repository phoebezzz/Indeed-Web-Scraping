from scrapy import Spider, Request
from indeed.items import IndeedItem
import re

class IndeedSpider(Spider):
	name = 'indeed_spider'
	allowed_urls = ['https://www.indeed.com/']
	start_urls = ['https://www.indeed.com/']


	def parse(self,response):
		#print(start_urls)
	
		# defind pattern for all pages need to go through
		cities = [('Los+Angeles','CA'),('San+Jose','CA'),('Cambridge','MA'),('New+York','NY'),('Sunnyvale','CA'),('Seattle','WA'),('San+Francisco','CA'),('Chicago','IL'),('Boston','MA'),('Washington','DC'),('Atlanta','GA'),('Austin','TX'),('San+Diego','CA'),('Houston','TX')]
		
		search_urls=[]
		for city in cities:
			search_urls.append('https://www.indeed.com/jobs?q=Data+Science&l=' + city[0]+ '%2C+' + city[1])

		print("="*100)
		print("search_urls")
		print(search_urls)

		for search_url in search_urls:
			print("="*100)
			print("search_url")
			print(search_url)
			
			joblist_urls = [search_url + '&start={}'.format(x) for x in range(0, (((100-1)*10)+1),10)] 

			print("#"*100)
			print(joblist_urls)
		

			for url in joblist_urls:
				print("*"*100)
				print(url)
				yield Request(url=url, callback=self.parse_list_page)



	def parse_list_page(self,response):


		#part1 = response.xpath('//a[@class="jobtitle turnstileLink"]/@href').extract()
		detail_urls = response.xpath('//h2[@class="jobtitle"]/a/@href').extract()
		

		detail_urls = ['https://www.indeed.com' + url for url in detail_urls]
		print(detail_urls)

		for url in detail_urls:
			yield Request(url=url, callback=self.parse_detail_page)



	def parse_detail_page(self, response):
		print("=" * 50)
		print(response.url)

		title = response.xpath('//b[@class="jobtitle"]/font/text()').extract_first()
		company = response.xpath('//span[@class="company"]/text()').extract_first()
		location = response.xpath('//span[@class="location"]/text()').extract_first()
		summary = response.xpath('//span[@id="job_summary"]').extract()

		print("title", title)
		print("company", company)
		print("location",location)

		try: 
			reviews = response.xpath('//span[@class="slNoUnderline"]/text()').extract_first() # can be None
		except IndexError:
			reviews = ""

		try:
			salary = response.xpath('//span[@class="no-wrap"]/text()').extract_first().strip() # can be None
		except:
			salary = ""


		item = IndeedItem()

		item['title'] = title
		item['company'] = company
		item['reviews'] = reviews
		item['location'] = location
		item['salary'] = salary
		item['summary'] = summary
		
		yield item







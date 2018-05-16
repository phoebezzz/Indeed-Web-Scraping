# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# https://doc.scrapy.org/en/latest/topics/items.html

import scrapy


class IndeedItem(scrapy.Item):
	# define the fields for your item here like:
	title = scrapy.Field()
	company = scrapy.Field()
	reviews = scrapy.Field()
	location = scrapy.Field()
	salary = scrapy.Field()
	summary = scrapy.Field()
	
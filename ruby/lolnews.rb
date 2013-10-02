#!/usr/bin/env ruby
require 'net/http'
require 'nokogiri'
require 'open-uri'

PAGE_URL = 'http://beta.na.leagueoflegends.com/en/news/'
page = Nokogiri::HTML(open(PAGE_URL))
page.css('h4 a').each_with_index do |story_link, index|
  puts "#{index + 1} => #{story_link.text}"
end

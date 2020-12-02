require 'nokogiri'
require 'open-uri'
require 'pry'

def scraper
  summoner = "camiyoka"
  site = "https://u.gg/lol/profile/na1/" +summoner+"/overview"
  unparsed_page = open(site)
  parsed_page = Nokogiri::HTML(unparsed_page)

  stats = []

  parsed_page.css(
  binding.pry

end

scraper

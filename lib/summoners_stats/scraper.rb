class SummonersStats::Scraper

require 'nokogiri'
require 'open-uri'
require 'pry'

  def self.scrape(name)
    str_name = name.strip.to_s
    site = "https://u.gg/lol/profile/na1/" +str_name+"/overview"
    unparsed_page = URI.open(site)
    parsed_page = Nokogiri::HTML(unparsed_page)
    page = parsed_page.css("div.summoner-profile_info_rank.large")

    page.each do |player|

      elo = "ELO: " + player.css(".rank-text").text.gsub("/", " at ")
      winrate = "WIN RATE: " + player.css(".rank-wins strong").text
      num_games = "NUMBER OF GAMES PLAYED: " + player.css(".rank-wins .total-games").text
      #binding.pry

      SummonersStats::Player.new(str_name, elo, winrate, num_games)
    end

  end

end

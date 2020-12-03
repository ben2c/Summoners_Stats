class SummonersStats::Scraper

require 'nokogiri'
require 'open-uri'
require 'pry'

  def self.scraper
    summoner = "whae"
    str_name = name.to_s
    site = "https://u.gg/lol/profile/na1/" +summoner+"/overview"
    unparsed_page = open(site)
    parsed_page = Nokogiri::HTML(unparsed_page)
    page = parsed_page.css("div.summoner-profile_info_rank")
    stats = []

    page.each do |player|
      #SummonersStats::Player_Name
      #elo = parsed_page.css("div.summoner-profile_info_rank.large .rank-text").text.gsub("/", " at ")
      #winrate = parsed_page.css("div.summoner-profile_info_rank.large .rank-wins strong").text
      #num_games = parsed_page.css("div.summoner-profile_info_rank.large .rank-wins .total-games").text
      elo = player.css(".rank-text").text.gsub("/", " at ")
      winrate = player.css(".rank-wins strong").text
      num_games = player.css(".rank-wins .total-games").text
      #binding.pry
      stats = [elo, winrate, num_games]
    end

    stats
  end

end

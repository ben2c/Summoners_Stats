class SummonersStats::Scraper

require 'nokogiri'
require 'open-uri'
require 'pry'

  def self.scrape(name)
    summoner = "camiyoka"
    site = "https://u.gg/lol/profile/na1/" +name+"/overview"
    unparsed_page = URI.open(site)
    parsed_page = Nokogiri::HTML(unparsed_page)
    page = parsed_page.css("div.summoner-profile_info_rank")
    stats = []

    page.each do |player|
      #SummonersStats::Player_Name
      #elo = parsed_page.css("div.summoner-profile_info_rank.large .rank-text").text.gsub("/", " at ")
      #winrate = parsed_page.css("div.summoner-profile_info_rank.large .rank-wins strong").text
      #num_games = parsed_page.css("div.summoner-profile_info_rank.large .rank-wins .total-games").text
      elo = "ELO: " + player.css(".rank-text").text.gsub("/", " at ")
      winrate = "WINRATE: " + player.css(".rank-wins strong").text
      num_games = "NUMBER OF GAMES PLAYED: " + player.css(".rank-wins .total-games").text
      #binding.pry

      stats = [elo, winrate, num_games]
    end

    if stats[0] == "ELO: Unranked"
      stats[1] = "WINRATE: N/A"
      stats[2] = "NUMBER OF GAMES PLAYED: N/A"
    end
    stats
  end

end

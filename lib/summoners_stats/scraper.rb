class SummonersStats::Scraper

require 'nokogiri'
require 'open-uri'
require 'pry'

  def scraper
    summoner = "camiyoka"
    site = "https://u.gg/lol/profile/na1/" +summoner+"/overview"
    unparsed_page = open(site)
    parsed_page = Nokogiri::HTML(unparsed_page)

    stats = []

    ranked_solo_elo = parsed_page.css("div.summoner-profile_info_rank.large strong").text[0...9]
    ranked_solo_LP = parsed_page.css("div.summoner-profile_info_rank.large strong").text[9...14]
    ranked_solo_winrate = parsed_page.css("div.summoner-profile_info_rank.large strong").text[14...20]
    ranked_solo_num_games = parsed_page.css("div.summoner-profile_info_rank").css("span.total-games").text[0...8]
    ranked_flex_elo = parsed_page.css("div.summoner-profile_info_rank").text[51...60]
    ranked_flex_LP = parsed_page.css("div.summoner-profile_info_rank").text[61...65]
    ranked_flex_winrate = parsed_page.css("div.summoner-profile_info_rank").text[65...71]
    ranked_flex_num_games = parsed_page.css("div.summoner-profile_info_rank").text[71...79]
    #binding.pry
  end

end
scraper

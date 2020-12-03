class SummonersStats::CLI
  @@muted="\e[1;31m"
  @@grn="\e[1;32m"
  @@blu="\e[1;34m"
  @@mag="\e[1;35m"
  @@cyn="\e[1;36m"
  @@white="\e[0m"

  def start
    puts "This program allows you to search up stats for a LOL account."
    get_name
  end

  def get_name
    puts "#{@@grn}Enter summoner's name.#{@@white}"
    @input = gets.strip.to_s
    if @input.length == 0
      get_name
    else
      display_name
    end
    player_data
  end

  def display_name
    puts "#{@@grn}", "The following stats are for: "+ @input, "#{@@white}"
  end

  def player_data
    puts SummonersStats::Scraper.scrape(@input)
  end

end

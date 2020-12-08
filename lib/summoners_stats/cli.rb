require 'pry'

class SummonersStats::CLI
  #Bash color to change text color in CLI
  @@muted="\e[1;31m"
  @@grn="\e[1;32m"
  @@blu="\e[1;34m"
  @@mag="\e[1;35m"
  @@cyn="\e[1;36m"
  @@white="\e[0m"

  def start
    #The main method of the app that executes and controls the order of the methods
    puts "#{@@blu}This program allows you to search up stats for a LOL account.#{@@white}", ""
    @i = 0
    while @input != 'exit'
      puts "#{@@grn}Enter a summoner's name.#{@@white}"
      get_input
      display_name
      print_player_data
      @i+=1
      continue_or_exit
    end
    exit_prompt
  end

  def display_name
    puts "#{@@grn}", "The following stats are for: "+ @input, "#{@@white}"
  end

  def print_player_data
    #Grabs data from the Player class and prints with the correct player name
    SummonersStats::Scraper.scrape(@input)
    stats = SummonersStats::Player.all[@i]
    puts stats.elo
    puts stats.win_rate
    puts stats.num_games, ""
  end

  def get_input
    @input = gets.strip.to_s
  end

  def valid_input
    @input.length == 0
  end

  def continue_or_exit
    puts "To continue, enter any key. To exit, enter 'exit'"
    get_input
  end

  def exit_prompt
    puts "Programming is exiting.", ""
  end

end

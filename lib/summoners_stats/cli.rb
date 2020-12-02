class SummonersStats::CLI

  def start
    puts "This program allows you to search up stats for a LOL account."
    get_name
  end

  def get_name
    puts "Enter summoner's name."
    @name = gets.strip
    if @name.length == 0
      get_name
    else
      name
    end
  end

  def name
    puts "The following stats are for: "+ @name
  end


end

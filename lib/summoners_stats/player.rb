require 'pry'

class SummonersStats::Player
  attr_accessor :name, :elo, :win_rate, :num_games

  @@all = []

  def initialize(name, elo, win_rate, num_games)
    @name = name
    @elo = elo
    @win_rate = win_rate
    @num_games = num_games
    @@all << self
  end

  def self.all
    @@all
  end

end


#blog on self

class SummonersStats::Player_Name
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.name
    SummonersStats::Scraper.scraper
  end

end

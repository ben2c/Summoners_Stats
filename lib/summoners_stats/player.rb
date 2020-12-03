class SummonersStats::Player
  attr_reader :name

  @@ign = ""

  def initialize(name)
    @name = name
    save
  end

  def self.name
    SummonersStats::Scraper.scraper
  end

  def save
    @@ign << self
  end

end

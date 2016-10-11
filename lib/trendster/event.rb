class Trendster::Event

 attr_accessor :name, :description, :date, :location, :audience

  @@all = []

  @events_array = Trendster::Scraper.scrape_library_page

  def initialize(event_hash)
    event_hash.each {|k,v| self.send(("#{k}="), v)}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create_from_collection(events_array)

    events_array.each do |event_hash|
      self.new(event_hash)
    end
  end

end





require './lib/trendster'

class Trendster::Trend

 attr_accessor :name, :url, :tweet_count

@@all = []

  @trends_array = Trendster::Scraper.scrape_twitter_page

  def initialize(trend_hash)
    trend_hash.each {|k,v| self.send(("#{k}="), v)}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create_from_collection(trends_array)
    @trends_array.each do |trend_hash|
      self.new(trend_hash)
    end
  end

  def self.trend_details
    #returns an array of Trend objects with their attributes
    trend_1 = self.new(trend_hash)
    trend_1.name = "WhenIWasYoung"
    trend_1.url = "https://twitter.com/hashtag/WhenIWasYoung?src=tren"
    trend_1.tweet_count = "48K Tweets"

    trend_2 = self.new(trend_hash)
    trend_2.name = "#WednesdayWisdom"
    trend_2.url = "https://twitter.com/hashtag/WednesdayWisdom?src=tren"
    trend_2.tweet_count = "64K Tweets"

    [trend_1, trend_2]
  
  end
  

end





require './lib/trendster'

class Trendster::Trend

 attr_accessor :name, :url, :tweet_count

@@all = []
  #def initialize(name, site, url)
   # @name = name
   # @url = url
   # @tweet_count = tweet_count
  #end

#should list current Twitter trends.


  def self.list_trends
    puts "Here's what's trending today on Twitter:"
    @trends = []
    Trendster::Trend.trend_details.each{|x| @trends << x.name}
    counter = 0
    @trends.each{|trend_name| counter +=1; puts "#{counter}. #{trend_name}"}
  end

  def self.trend_details

    trend_1 = self.new
    trend_1.name = "WhenIWasYoung"
    trend_1.url = "https://twitter.com/hashtag/WhenIWasYoung?src=tren"
    trend_1.tweet_count = "48K Tweets"

    trend_2 = self.new
    trend_2.name = "#WednesdayWisdom"
    trend_2.url = "https://twitter.com/hashtag/WednesdayWisdom?src=tren"
    trend_2.tweet_count = "64K Tweets"

    [trend_1, trend_2]
  
  end
  

end





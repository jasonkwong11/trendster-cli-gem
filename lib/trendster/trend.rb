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
    puts "See what's trending today on Twitter!"
    #puts <<-DOC
    #1. Kyrie Irving, 2. #WhatMyBestFriendTaughtMe, 3. WhenIWasYoung 4. Sheniah Twain
    #DOC
    puts @trends = Trendster::Trend.trend_details.map{|x| x.name}
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





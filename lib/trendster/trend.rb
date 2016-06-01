class Trendster::Trend

 attr_accessor :name, :site, :url

  def initialize(name, site, url)
    @name = name
    @site = site
    @url = url
  end

  def self.list_trends(input)
    #list trends after user inputs a selection
    if input == "1"
      puts "Facebook Trend 1"
      puts "Facebook Trend 2"
    elsif input == "2"
      puts "Twitter Trend 3"
      puts "Twitter Trend 4"
      puts "Twitter Trend 5"
    elsif input == "3"
      puts "Youtube Trend 6"
      puts "Youtube Trend 7"
    elsif input == "4" 
      puts "Youtube Trend 8"
      puts "Youtube Trend 9"
    elsif input == "list"
        list_social_media
    else
        puts "Please enter a number 1-4. 'list' or 'exit'"
    end
      
  end

end





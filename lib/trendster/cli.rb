require './lib/trendster'
require 'pry'

class Trendster::CLI
#domino order of methods to run:
  def call
    make_trends
    list_trends
    menu
    goodbye
  end
#should instantiate new trend objects
  def make_trends
    trend_array = Trendster::Scraper.scrape_twitter_page
    Trendster::Trend.create_from_collection(trend_array)

  end

#should list current Twitter trends.

  def list_trends
    puts "Here's what's trending today on Twitter:"
    @trends = []
    Trendster::Trend.all.each{|x| @trends << x.name}
    counter = 0
    @trends.each{|trend_name| counter +=1; puts "#{counter}. #{trend_name}"}

  end


  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the event you'd like more info on, 'list' to see the trends again, or type 'exit'."
      input = gets.strip

      if input.to_i > 0
        puts Trendster::Trend.all[input.to_i - 1].name
        puts Trendster::Trend.all[input.to_i - 1].description
        puts Trendster::Trend.all[input.to_i - 1].date
        puts "Location: #{Trendster::Trend.all[input.to_i - 1].location}"
        puts "Audience: #{Trendster::Trend.all[input.to_i - 1].audience}"
      elsif input == "list"
        list_trends
      elsif input == "exit"
        break
      else
        puts "Please enter a number 1-4. 'list' or 'exit'"
      end

    end
  end

  def goodbye
    puts "See you next time for more library events!"
  end

end




require './lib/trendster'

class Trendster::CLI
#domino order of methods to run:
  def call
    list_trends
    menu
    goodbye
  end

#should list current Twitter trends.

  def list_trends
    puts "Here's what's trending today on Twitter:"
    @trends = []
    Trendster::Trend.trend_details.each{|x| @trends << x.name}
    counter = 0
    @trends.each{|trend_name| counter +=1; puts "#{counter}. #{trend_name}"}
  end


  def menu
    input = nil
    while input != "exit"
      puts "Enter the name of the trend you'd like more info on, list to see the trends again, or type exit."
      input = gets.strip

      if input.to_i > 0
        puts Trendster::Trend.trend_details[input.to_i - 1].name
        puts Trendster::Trend.trend_details[input.to_i - 1].url
        puts Trendster::Trend.trend_details[input.to_i - 1].tweet_count
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
    puts "See you next time for more Twitter trends!"
  end

end




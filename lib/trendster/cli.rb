require './lib/trendster'

class Trendster::CLI
#domino order of methods to run:
  def call
    Trendster::Trend.list_trends
    menu
    goodbye
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
        Trendster::Trend.list_trends
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




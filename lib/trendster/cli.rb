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
      puts "Enter the number of the trend you'd like more info on, list to see the trends again, or type exit."
      input = gets.strip.downcase
      case input
      when "1"
        puts Trendster::Trend.trend_details[0].name
        puts Trendster::Trend.trend_details[0].url
        puts Trendster::Trend.trend_details[0].tweet_count
      when "2"
        puts Trendster::Trend.trend_details[1].name
        puts Trendster::Trend.trend_details[1].url
        puts Trendster::Trend.trend_details[1].tweet_count
      when "3"
        puts "More info on WhenIWasYoung trend.."
      when "4"
        puts "More info on Sheniah Twain trend.."  
      when "list"
        Trendster::Trend.list_trends
      when "exit"
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




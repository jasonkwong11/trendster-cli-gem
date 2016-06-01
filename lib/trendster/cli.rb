
class Trendster::CLI
#domino order of methods to run:
  def call
    list_trends
    menu
    goodbye
  end
#should list social media options: Facebook, Twitter, etc.
  def list_trends
    puts "See what's trending today on Twitter!"
    puts <<-DOC
    1. Kyrie Irving, 2. #WhatMyBestFriendTaughtMe, 3. WhenIWasYoung 4. Sheniah Twain
    DOC
    #@trends = Trendster::Trend.today
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the trend you'd like more info on, list to see the trends again, or type exit."
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on Kyrie Irving trend.."
      when "2"
        puts "More info on #WhatMyBestFriendTaughtMe trend.."
      when "3"
        puts "More info on WhenIWasYoung trend.."
      when "4"
        puts "More info on Sheniah Twain trend.."  
      when "list"
        list_trends
      end
    end
  end

  def goodbye
    puts "See you next time for more Twitter trends!"
  end

end




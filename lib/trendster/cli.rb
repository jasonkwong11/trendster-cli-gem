
class Trendster::CLI

  def call
    list_social_media
    menu
    goodbye
  end

  def list_social_media
    puts "See what's trending today on social media!"
    puts <<-DOC

    *Show a list of social media sites:
    1. Facebook, 2. Twitter, 3. Youtube, and 4. Google

    DOC
    @trends = Trendster::Trend.today
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the social media site you'd like more info on, or list to see the social media sites or type exit"
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on Facebook trends.."
      when "2"
        puts "More info on Twitter trends.."
      when "3"
        puts "More info on Youtube trends.."
      when "4"
        puts "More info on Google trends.."
      when "list"
        list_social_media
      else
        puts "Please enter a number 1-4. 'list' or 'exit'"
      end
    end
  end

  def goodbye
    puts "See you tomorrow for more social media trends!"
  end

end




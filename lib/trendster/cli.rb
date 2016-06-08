
class Trendster::CLI
#domino order of methods to run:
  def call
    make_events
    list_events
    menu
    goodbye
  end
#should instantiate new event objects
  def make_events
    events_array = Trendster::Scraper.scrape_library_page
    Trendster::Event.create_from_collection(events_array)
  end

#should list current library events.

  def list_events
    puts "Here are the most recent events at the Cuyahoga County Public Library!:"
    @events = []
    Trendster::Event.all.each{|x| @events << x.name}
    @counter = 0
    @events.each{|event_name| @counter +=1; puts "#{counter}. #{event_name}"}
  end


   def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the event you'd like more info on, 'list' to see the events again, or type 'exit'."
      input = gets.strip

      if input.to_i > 0 && Trendster::Event.all[input.to_i - 1] != nil
        puts Trendster::Event.all[input.to_i - 1].name
        puts Trendster::Event.all[input.to_i - 1].description
        puts Trendster::Event.all[input.to_i - 1].date
        puts "Location: #{Trendster::Event.all[input.to_i - 1].location}"
        puts "Audience: #{Trendster::Event.all[input.to_i - 1].audience}"
      elsif input == "list"
        list_events
      elsif input == "exit"
        break
      else
        puts "Please enter a valid number, 'list' or 'exit'"
      end
  end

  def goodbye
    puts "See you next time for more library events!"
  end

end




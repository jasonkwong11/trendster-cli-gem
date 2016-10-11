class Trendster::CLI

  #domino order of methods to run

  def call
    make_events
    list_events
    menu
    goodbye
  end

  def make_events
    events_array = Trendster::Scraper.scrape_library_page
    Trendster::Event.create_from_collection(events_array)
  end

  #should list current library events

  def list_events
    puts "Here are the most recent events at the Cuyahoga County Public Library:"
    all_events = Trendster::Event.all
    all_events.each do |event|
      puts "#{all_events.index(event) + 1}. #{event.name}"
    end
  end

  def menu
    input = nil

    while input != "exit"

      selected_event = Trendster::Event.all[input.to_i - 1] if input != "list"
   
      puts "Enter the number of the event you'd like more info on, 'list' to see the events again, or type 'exit'."
      input = gets.strip

        if input.to_i > 0 && selected_event != nil
          puts selected_event.name
          puts selected_event.description
          puts selected_event.date
          puts "Location: #{selected_event.location}"
          puts "Audience: #{selected_event.audience}"
        elsif input == "list"
          list_events
        elsif input == "exit"
          break
        else
          puts "Please enter a valid number, 'list' or 'exit'"
        end
    end
  end

  def goodbye
    puts "See you next time for more library events!"
  end

end












      
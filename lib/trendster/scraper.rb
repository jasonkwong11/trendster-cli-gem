class Trendster::Scraper

  @@all = []

  attr_accessor :name, :description, :date, :location, :audience
  
    def self.all
      @@all
    end

    def self.scrape_library_page
      all_array = []
      index_url = "http://cuyahogalibrary.org/Events/Event-Results.aspx"
      index_doc = Nokogiri::HTML(open(index_url))
        index_doc.css("article.sixcol").each do |event|
          #a single url for each event...
        event_url = "http://cuyahogalibrary.org" + event.css("a")[0]['href'] #a single url ending
        #a single doc created for each event_url
        event_doc = Nokogiri::HTML(open(event_url))
       all_array << {
        name: event_doc.css("h3").text,
        description: event_doc.css("p.one-large-content").text || "",
        date: event_doc.css("strong").text,
        location: event_doc.css("p").css("a").text,
        audience: event_doc.css("p").text.match("Adults") || event_doc.css("p").text.match("Children") 
      }
      end
      all_array
    end

end
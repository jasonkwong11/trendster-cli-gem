class Trendster::Scraper

@@all = []

attr_accessor :name, :description, :date, :location, :audience
  
  def self.all
    @@all
  end

  def self.scrape_library_page
    url_endings = []
    index_url = "http://cuyahogalibrary.org/Events/Event-Results.aspx"
    index_doc = Nokogiri::HTML(open(index_url))
      index_doc.css("article.sixcol").each do |event|
        url_endings << event.css("a")[0]['href']
      end
    event_urls = []
      url_endings.each do |url_ending|
        event_urls << "http://cuyahogalibrary.org" + url_ending
      end
    event_doc_array = []
      event_urls.each do |event_url|
        event_doc = Nokogiri::HTML(open(event_url))
       event_doc_array << event_doc
      end
      all_array = []
    event_doc_array.each do |event_doc|
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
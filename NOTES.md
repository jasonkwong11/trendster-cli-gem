What's Trending Today? on Facebook, Twitter, and Youtube, Google

How to Build a CLI Gem

1. Plan your gem, imagine your interface
  -Summary: a command line interface for whats trending on Facebook, Twitter, Youtube, and Google


  *Show a list of social media sites:
    1. Facebook, 2. Twitter, 3. Youtube, and 4. Google, and the date
  *Pick a site to check what's trending. Enter 1-4.
  *Display the list of trending topics for that social media site (and maybe description too)
  **ANOTHER LEVEL: More detailed info about the trending item
*********************************
  STRUCTURE:

  [program runs]

"See what's trending now on Twitter!"

[List of Twitter trends populate vertically:

1. Kyrie Irving
2. #WhatMyBestFriendTaughtMe
3. WhenIWasYoung
4. Sheniah Twain 
]

Enter the number of the trend you'd like more info on, list to see the trends again, or type exit.
  [user enters input, 3]

[WhenIWasYoung Trend Populates:
  -name: WhenIWasYoung
  -tweetcount: 9,129 Tweets
  -sample tweet: US Fish and Wildlife: #WhenIWasYoung they said it gets better & that one day I'd be a butterfly. 
  -sample tweet favs: 12
  -sample tweet retweets: 4

]  


********************************
2. Start with the project structure - google
3. Start with the entry point - the file run
4. force that to build the CLI interface
5. stub out the interface
6. start making things real

  -What is a trend/trending item?
    A trending item has a name.
    A trending item has a social media site it belongs to.
    A trending item has a URL.

    A trending Twitter item has a tweet count.
    A trending Facebook item has a description.
    A trending Youtube item has a view count and ranking.
    A trending Google item has a ranking.


7. discover objects
8. program


trend.rb:

Nokogiri: returns an array of hashes. Each hash is a trend's name, trend's url, trend's tweet count


Trend.initialize:
  -use a single trend's hash of attributes to create a new Trend Object

Trend.create_from_collection:
  -takes the Nokogiri array of hashes and iterates on each hash to create a new trend object by using initialize. (the save method then saves each trend object in an @@all array.)

Last Step: Method that returns an array of Trend objects with their attributes assigned







WORKING INITIAL EVENTS PAGE SCRAPER:

require './lib/trendster'
require 'nokogiri'
require 'open-uri'
require 'open_uri_redirections'
require 'pry'
require 'mechanize'

#scrapes the twitter page for name of the trend, url, and tweet count

class Trendster::Scraper


attr_accessor :name, :description, :date, :time

  def self.scrape_twitter_page
      array = []

    index_url = "http://cuyahogalibrary.org/Events/Event-Results.aspx"

    doc = Nokogiri::HTML(open(index_url))

    agent = Mechanize.new
    page = agent.get(index_url)

#INITAL EVENTS PAGE 1
    #EACH EVENT: doc.css("article.sixcol").text

    #TITLE: doc.css("div.small-item-content h4").first.text => "Baby and Me Storytime"
    #DESCRIPTION: doc.css("div.small-item-content p.screen-display").first.text => "Caregivers and their children ages Birth -18 monthsJoin us for rhymes, songs, fingerplays and books. "
    #DATE: doc.css("p strong").text => "Monday, June 06, 2016Monday, June 06, 2016Monday, June 06, 2016Monday, June 06, 2016Monday, June 06, 2016Monday, June 06, 2016Monday, June 06, 2016Monday, June 06, 2016Monday, June 06, 2016Monday, June 06, 2016Monday, June 06, 2016Monday, June 06, 2016Monday, June 06, 2016Monday, June 06, 2016Monday, June 06, 2016Monday, June 06, 2016Monday, June 06, 2016Monday, June 06, 2016Monday, June 06, 2016Monday, June 06, 2016"
    #TIME: 
    #LOCATION: 

    #eachprofile = doc.css("li.")

    doc.css("article.sixcol").each do |event|

      array << {
        name: event.css("div.small-item-content h4").first.text,
        description: event.css("div.small-item-content p.screen-display").first.text,
          #if there's a "view details" at the end of the string,
            #get the a href value and store it in a variable (should look like this 
              #/New-Pages/Events/Event-Results/Event-Detail.aspx?id=86247&et=Business and Career)
          #page_two_url = cuyahogalibrary.org + "a href value"
          #scrape that page for description
        date: event.css("p strong").text
      }
    end
    array
 binding.pry
  end

end



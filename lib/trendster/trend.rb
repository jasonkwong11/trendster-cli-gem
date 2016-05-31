class Trendster::Trend

 attr_accessor :name, :site, :url, :viewcount

  #def initialize(name, site, url)
  #  @name = name
  #  @site = site
  #  @url = url
  #end

def self.today

  trend_1 = self.new
  trend_1.name = "GORILLA GRABS CHILD WHO'S FALLEN INTO HABITAT AT CINCINNATI ZOO GORILLA GRABS CHILD WHOS FALLEN INT"
  trend_1.site = "Youtube"
  trend_1.url = "https://www.youtube.com/watch?v=UBeVfQtSD2k"
  trend_1.viewcount = "13,199,976"

  trend_2 = self.new
  trend_2.name = "GMOD PROP HUNT FUNNY MOMENTS - BANK ROBBERY SUPERHEROES! (GARRY'S MOD)"
  trend_2.site = "Youtube"
  trend_2.url = "https://www.youtube.com/watch?v=oS2JN9mPWTs"
  trend_2.viewcount = "3,270,840"

  [trend_1, trend_2]
end
end





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
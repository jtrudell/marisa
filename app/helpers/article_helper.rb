require 'bing-search'

def find_articles
  BingSearch.account_key = 'l1VfVxiJeygTtAUbcXL8O7A5Wpt3bmvH3+Z0eqX6HOE'
  results = []
  results << (BingSearch.web('yoga'))[rand(10)]
  results << (BingSearch.web('travel'))[rand(10)]
  results << (BingSearch.web('cats'))[rand(10)]
  results << (BingSearch.web('shopping'))[rand(10)]
  results << (BingSearch.web('meditation'))[rand(10)]
  results.shuffle
end

p find_articles

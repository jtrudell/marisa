require 'bing-search'

def find_articles
  BingSearch.account_key = 'l1VfVxiJeygTtAUbcXL8O7A5Wpt3bmvH3+Z0eqX6HOE'
  results = []
  results << (BingSearch.web('yoga', limit: 1)).pop
  results << (BingSearch.web('travel', limit: 1)).pop
  results << (BingSearch.web('cats', limit: 1)).pop
  results << (BingSearch.web('shopping', limit: 1)).pop
  results << (BingSearch.web('meditation', limit: 1)).pop
  results.shuffle
end

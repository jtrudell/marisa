require 'bing-search'

# def find_articles
#   BingSearch.account_key = 'l1VfVxiJeygTtAUbcXL8O7A5Wpt3bmvH3+Z0eqX6HOE'
#   results = []
#   yoga_results = []
#   shopping_results = []
#   yoga_results << BingSearch.web('yoga')
#   # results << (BingSearch.web('travel'))[rand(10)]
#   # results << (BingSearch.web('cats'))[rand(10)]
#   shopping_results << BingSearch.web('shopping')
#   # results << (BingSearch.web('meditation'))[rand(10)]
#   results << yoga_results[rand(10)]
#   results << yoga_results[rand(10)]
#   results << shopping_results[rand(10)]
#   results << shopping_results[rand(10)]
#   results.shuffle
# end

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

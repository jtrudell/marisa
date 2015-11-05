get "/" do
  @articles = find_articles
  erb :index
end

get "/" do
  @articles = find_articles
  @html = []
  erb :index
end

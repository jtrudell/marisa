enable :sessions
require "instagram"

CALLBACK_URL = "https://meowrisa.herokuapp.com/"

Instagram.configure do |config|
  config.client_id = "a963ba34ecb443bcbaeafa815a9154a9"
  config.client_secret = "b6a9c720d745491e890aa8302d636fe1"
end

get "/" do
  session[:tag] ? tag = session[:tag] : tag = "bideawee"
  @articles = find_articles
  @instagram_images = generate_instagram_images(tag)
  @twitter_feed = find_twitter
  @tag_title = tag
  erb :index
end

get "/tags/:tag" do
  session[:tag] = params[:tag]
  redirect "/"
end

get "/instagram/oauth" do
  redirect Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
end

get "/instagram/oauth/callback" do
  response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
  session[:access_token] = response.access_token
  redirect "/"
end

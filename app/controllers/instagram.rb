enable :sessions
require "instagram"

CALLBACK_URL = "https://meowrisa.herokuapp.com/"

Instagram.configure do |config|
  config.client_id = "a963ba34ecb443bcbaeafa815a9154a9"
  config.client_secret = "b6a9c720d745491e890aa8302d636fe1"
end

get "/oauth" do
  '<a href="/oauth/connect">Connect with Instagram</a>'
end

get "/oauth/connect" do
  redirect Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
end

get "/oauth/callback" do
  response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
  session[:access_token] = response.access_token
  redirect "/nav"
end


get "/tags" do
  client = Instagram.client(:access_token => session[:access_token])
  html = "<h1>Search for tags, get tag info and get media by tag</h1>"
  tags = client.tag_search('javascript')
  html << "<h2>Tag Name = #{tags[0].name}. Media Count =  #{tags[0].media_count}. </h2><br/><br/>"
  for media_item in client.tag_recent_media(tags[0].name)
    html << "<img src='#{media_item.images.thumbnail.url}'>"
  end
  html
end

get "/user_search" do
  client = Instagram.client(:access_token => session[:access_token])
  user = client.user_search("msg0927").pop
    html = "<li> <img src='#{user.profile_picture}'> #{user.username} #{user.full_name}</li>"
  html
end

get "/user_media_feed" do
  client = Instagram.client(:access_token => session[:access_token])
  user = client.user
  html = "<h1>#{user.username}'s media feed</h1>"

  page_1 = client.user_media_feed(777)
  page_2_max_id = page_1.pagination.next_max_id
  page_2 = client.user_recent_media(777, :max_id => page_2_max_id ) unless page_2_max_id.nil?
  for media_item in page_1
    html << "<img src='#{media_item.images.thumbnail.url}'>"
  end
  for media_item in page_2
    html << "<img src='#{media_item.images.thumbnail.url}'>"
  end
  html
end

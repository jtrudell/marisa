require "instagram"

def generate_instagram_images(tag)
  client = Instagram.client(:access_token => session[:access_token])
  tags = client.tag_search(tag)
  html = []
  img_src_array = []
  for media_item in client.tag_recent_media(tags[0].name)
    img_src_array << "<a href = '#{media_item.images.standard_resolution.url}'><img src='#{media_item.images.thumbnail.url}'></a>"
  end
  8.times do
    html << img_src_array.shuffle.pop
  end
  return html
end

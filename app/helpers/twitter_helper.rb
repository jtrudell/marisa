def find_twitter
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "tkW9BJHU5VI1M9A9VXK9JshCr"
    config.consumer_secret     = "rkM7dzllpnRy8TMhx7M7BybEFd7mYwRbBcaJffLijlNDL6oFDg"
    config.access_token        = "4127832340-3xtGu9WcLEk2E4RlTkQI5lX5Vtbmn7BxOhEktjX"
    config.access_token_secret = "OYoVNXbL5wgWjpmCaQwttQ7S3c2QesYYmDbxrE4VhRzgJ"
  end

  tweets = client.search("cats").take(6)

  return tweets.flatten.shuffle
end

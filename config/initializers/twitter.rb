Twitter.configure do |config|
  config.consumer_key = ENV["TWITTER_CONSUMER_KEY_PUBHACK"]
  config.consumer_secret = ENV["TWITTER_CONSUMER_SECRET_PUBHACK"]
  config.oauth_token = ENV["TWITTER_OAUTH_TOKEN_PUBHACK"]
  config.oauth_token_secret = ENV["TWITTER_OAUTH_TOKEN_SECRET_PUBHACK"]
end
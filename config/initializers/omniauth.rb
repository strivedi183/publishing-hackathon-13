Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_CONSUMER_KEY_PUBHACK'], ENV['TWITTER_CONSUMER_SECRET_PUBHACK']
end
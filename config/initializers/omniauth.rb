Rails.application.config.middleware.use OmniAuth::Builder do
  provider :tumblr, ENV["consumer_key"], ENV["consumer_secret"]
end

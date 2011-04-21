Rails.application.config.middleware.use OmniAuth::Builder do
   use OmniAuth::Strategies::Twitter, ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET']
end

class SaveTweet < SimpleRecord::Base
  has_strings :tweet_id, :user_id
end

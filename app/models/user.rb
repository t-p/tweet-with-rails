class User < SimpleRecord::Base
  has_strings :user_id
  has_many :save_tweets

  def self.find_user
    find(:first, :select => 'user_id')
  end
end

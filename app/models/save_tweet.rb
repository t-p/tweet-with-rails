class SaveTweet < SimpleRecord::Base
  has_strings :tweet_id
  belongs_to :user

  def self.find_all
    find(:all, :order => 'created DESC', :select => 'tweet_id')
  end

end

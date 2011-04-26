class SaveTweet < SimpleRecord::Base
  has_strings :tweet_id

  def self.find_all
    find(:all, :order => 'created DESC', :select => 'tweet_id')
  end

end

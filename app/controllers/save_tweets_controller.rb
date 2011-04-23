class SaveTweetsController < ApplicationController

  def index
    @save_tweets = SaveTweet.find(:all, :order => 'created DESC', :select => 'tweet_id').map(&:tweet_id)
  end

  def show
    @save_tweet = SaveTweet.find(:all)

  end

#  def new
#    @save_tweet = SaveTweet.new
#  end

  def create
    params[:tweet_ids].each do |id|
      @save_tweet = SaveTweet.new(:tweet_id => id)
      @save_tweet.save
    end
    redirect_to(save_tweets_path)
  end

  def destroy
    @save_tweet = SaveTweet.find(:first, :tweet_id => params[:id])
    @save_tweet.destroy
    redirect_to(save_tweets_path)
  end

end

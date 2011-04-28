class SaveTweetsController < ApplicationController

  before_filter :fetch_saved_user

  def index
    @save_tweets = SaveTweet.find_all.map(&:tweet_id)
  end

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

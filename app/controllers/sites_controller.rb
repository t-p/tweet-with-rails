class SitesController < ApplicationController


  def index
#   @user_id = client.user.id
#   @user_id = User.find_user.map(&:user_id)   
  end

  def user_info
    @user = client.user 
  end

  def trend
    @trend = Twitter::Search.new.q(params[:id]).language("de").result_type("recent").no_retweets.fetch
  end

end

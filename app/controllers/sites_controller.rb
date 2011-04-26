class SitesController < ApplicationController
  def index
    
  end

  def user_info

  end

  def trend
    @trend = Twitter::Search.new.q(params[:id]).language("de").result_type("recent").no_retweets.fetch
  end

end

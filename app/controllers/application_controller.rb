class ApplicationController < ActionController::Base
  protect_from_forgery

  after_filter :close_sdb_connection

  private

  def client
    Twitter.configure do |config|
      config.consumer_key = ENV['CONSUMER_KEY']
      config.consumer_secret = ENV['CONSUMER_SECRET']
      config.oauth_token = session['access_token']
      config.oauth_token_secret = session['access_secret']
    end
    @client ||= Twitter::Client.new
  end

  def signed_in?
    session[:nickname] && session[:access_token] && session[:access_secret]
  end

  def close_sdb_connection
      SimpleRecord.close_connection
  end

  helper_method :client, :signed_in?
end

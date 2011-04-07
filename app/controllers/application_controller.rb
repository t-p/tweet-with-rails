class ApplicationController < ActionController::Base
  protect_from_forgery

  def parse_for_url(text)
    # The regex could probably still be improved, but this seems to do the
    # trick for most cases.
    text.gsub(/(https?:\/\/\w+(\.\w+)+(\/[\w\+\-\,\%]+)*(\?[\w\[\]]+(=\w*)?(&\w+(=\w*)?)*)?(#\w+)?)/i, '<a class="external" href="\1" target="_blank">\1</a>')
  end

  private

  def client
    Twitter.configure do |config|
      config.consumer_key = '7ff8zzrVNj6eAdBeZAxJSA'
      config.consumer_secret = 'A4PZaWMF9urlyjhvBe8esGSJZlCRH6gCzPjWrcoOKs'
      config.oauth_token = session['access_token']
      config.oauth_token_secret = session['access_secret']
    end
    @client ||= Twitter::Client.new
  end

  def signed_in?
    session[:nickname] && session[:access_token] && session[:access_secret]
  end

  helper_method :client, :signed_in?
end

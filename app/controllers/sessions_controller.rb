class SessionsController < ApplicationController
  def new
    @user = client.user if signed_in?
  end

  def callback
    sign_in(request.env['omniauth.auth'])
    redirect_to root_path, :notice => "Signed in to Twitter!"
  end

  def destroy
    reset_session
    redirect_to root_path, :notice => "Signed out!"
  end

  private

  def sign_in(auth)
    if auth
      session[:nickname] = auth['user_info']['nickname']
      session[:access_token] = auth['credentials']['token']
      session[:access_secret] = auth['credentials']['secret']
    end
  end
end

class SessionsController < ApplicationController

  def callback
    sign_in(request.env['omniauth.auth'])
    redirect_to root_path, :notice => "Signed in to Twitter!"
  end

  def error
    redirect_to root_path, :alert => "Sign in with Twitter failed!"
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

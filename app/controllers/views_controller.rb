class ViewsController < ApplicationController
  def tweets
    @user = client.list_timeline('tfkp', 'diverse') if signed_in?
  end
end

class HomeController < ApplicationController
  # before_filter :authenticate_user

  def index

  end

  def user_login #AJAX
    user_lookup = User.find_by_username_and_password(params[:username], params[:password])

    # if user is found, login, set session,
    # if user is not found, ask to re-login / sign-up
    if user_lookup
      session[:user_id] = user_lookup.id
      render :json => {:status => 'ok', :authenticated => 'true'}
    else
      render :json => {:status => 'ok', :authenticated => 'false'}
    end
  end
end

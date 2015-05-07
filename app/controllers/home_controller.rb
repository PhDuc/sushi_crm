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

  def user_register #AJAX
    Rails.logger.info "PARAMS: #{params.inspect}"
    username_lookup = User.find_by_username(params[:username])
    email_lookup = User.find_by_email(params[:email])
    if params[:username].blank? || params[:email].blank? || params[:password].blank? || params[:first_name].blank? || params[:last_name].blank?
      render :json => {:status => 'ok', :success => 'false', :reason => 'Missing information' }
    elsif username_lookup
      render :json => {:status => 'ok', :success => 'false', :reason => 'Existing Username' }
    elsif email_lookup
      render :json => {:status => 'ok', :success => 'false', :reason => 'Existing Email' }
    else
      user = User.create(username: params[:username], first_name: params[:first_name], last_name: params[:last_name], password: params[:password])
      user.save!
      if user.id #lol
        render :json => {:status => 'ok', :success => 'true'}
      else
        render :json => {:status => 'ok', :success => 'false', :reason => 'Something went wrong' }
      end
    end
  end
end

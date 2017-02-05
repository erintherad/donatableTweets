class SessionsController < ApplicationController
  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']

    user = User.find_by(twitter_handle: auth_hash[:info][:nickname])
    user ||= User.create!(
      full_name: auth_hash[:info][:name],
      twitter_handle: auth_hash[:info][:nickname],
      location: auth_hash[:info][:location]
    )

    session[:user_id] = user.id

    redirect_to dashboard_path
  end

  def failure
  end

  def logout
    session[:user_id] = nil

    redirect_to root_path
  end
end

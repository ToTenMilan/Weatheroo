class SessionsController < ApplicationController
  def new
  end

  def create
    auth = Authentication.new(params)
    if auth.authenticated?
      session[:user_id] = auth.user.id
      redirect_to root_url, notice: 'You have logged in successfully'
    else
      flash.now.alert = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'You have logged out successfully'
  end
end

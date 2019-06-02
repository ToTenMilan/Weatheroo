class ApplicationController < ActionController::Base

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    @current_user.present?
  end

  # def authorize
  #   redirect_to login_url, alert: 'Not authorized' if current_user.nil?
  # end

  helper_method :current_user, :logged_in?
end

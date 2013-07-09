class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    @current_user ||= User.find_by_token(params[:token]) if params[:token]
  end

  def logged_in?
    !!current_user
  end

  def authenticate_user
   render :json => ["Must be logged in."], :status => :forbidden unless logged_in?
  end
end

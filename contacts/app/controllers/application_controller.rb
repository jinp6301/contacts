class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    @current_user ||= User.find_by_token(params[:token]) if params[:token]
  end

  def logged_in?
    !!current_user
  end

  def authenticate_user
    unless logged_in?
      render :json => "Must be logged in.", :status => :forbidden
    end
  end

end

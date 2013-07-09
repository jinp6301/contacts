class UsersController < ApplicationController
  before_filter :authenticate_user, :except => [:create]

  def create
    user = User.new(params[:user])
    if user.save
      render :json => user
    else
      render :json => user.errors, :status => :unprocessable_entity
    end
  end

  def show
    render :json => current_user
  end

  def update
    if params[:user] && current_user.update_attributes(params[:user])
      render :json => current_user
    else
      render :json => current_user.errors, :status => :unprocessable_entity
    end
  end

  def destroy
    current_user.destroy
    render :json => ["Success. User deleted."]
  end
end

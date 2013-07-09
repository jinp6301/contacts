class UsersController < ApplicationController
  def index
    render :json => { 'users' => User.all }
  end

  def create
    user = User.new(params[:user])
    if user.save
      render :json => user
    else
      render :json => user.errors, :status => :unprocessable_entity
    end
  end

  def show
    user = User.find(params[:id])
    render :json => user
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(params[:user])
      render :json => user
    else
      render :json => user.errors, :status => :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render :json => "Success. User deleted."
  end
end

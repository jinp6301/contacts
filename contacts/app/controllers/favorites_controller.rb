class FavoritesController < ApplicationController

  before_filter :authenticate_user

  def index
    fav_contacts = current_user.favorite_contacts
    render :json => { "favorites" => fav_contacts}
  end

  def create
    params[:favorite][:user_id] = current_user.id
    favorite = Favorite.new(params[:favorite])
    if favorite.save
      render :json => favorite
    else
      render :json => favorite.errors, :status => :unprocessable_entity
    end
  end

  def destroy
    favorite = Favorite.find(params[:id])
    if favorite.user == current_user
      favorite.destroy
      render :json => "Success. Favorite deleted."
    else
      render :json => "Can't delete others' favorites", :status => :forbidden
    end
  end
end

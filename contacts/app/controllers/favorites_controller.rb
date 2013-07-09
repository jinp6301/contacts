class FavoritesController < ApplicationController
  def index
    fav_contacts = User.find(params[:user_id]).favorite_contacts
    render :json => { 'favorites' => fav_contacts}
  end

  def create
    favorite = Favorite.new(params[:favorite])
    if favorite.save
      render :json => favorite
    else
      render :json => favorite.errors, :status => :unprocessable_entity
    end
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy
    render :json => "Success. Favorite deleted."
  end
end

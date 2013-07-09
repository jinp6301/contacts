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
    favorite = Favorite.find_by_user_id_and_contact_id(current_user.id,
                params[:contact_id])
    if favorite
      favorite.destroy
      render :json => ["Success. Favorite deleted."]
    else
      render :json => ["Favorite doesn't exist"], :status => :unprocessable_entity
    end
  end
end

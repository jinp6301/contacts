class ContactsController < ApplicationController

  before_filter :authenticate_user

  def index
    render :json => {'contacts' => current_user.contacts}
  end

  def create
    params[:contact][:user_id] = current_user.id
    contact = Contact.new(params[:contact])
    if contact.save
      render :json => contact
    else
      render :json => contact.errors, :status => :unprocessable_entity
    end
  end

  def show
    contact = Contact.find(params[:id])
    if contact.user == current_user
      render :json => contact
    else
      render :json => "Can't view others' contacts", :status => :forbidden
    end
  end

  def update
    contact = Contact.find(params[:id])
    if contact.user == current_user
      if params[:contact] && contact.update_attributes(params[:contact])
        render :json => contact
      else
        render :json => contact.errors, :status => :unprocessable_entity
      end
    else
      render :json => "Can't edit others' contacts", :status => :forbidden
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    if contact.user == current_user
      contact.destroy
      render :json => "Success. Contact deleted."
    else
      render :json => "Can't delete others' contacts", :status => :forbidden
    end
  end
end

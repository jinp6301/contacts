class SessionsController < ApplicationController

  before_filter :authenticate_user, :except => [:create]

  def create
    user = User.where(email: params[:email], password: params[:password]).first
    if user
      user.token = generate_token
      user.save!
      render :json => {:token => user.token}
    else
      render :json => 'Wrong credentials', :status => :forbidden
    end
  end

  def destroy
    current_user.token = nil
    current_user.save!
    render :json => current_user
  end

  private
    def generate_token
      token = SecureRandom.urlsafe_base64(16)
      until User.find_by_token(token).nil?
        token = SecureRandom.urlsafe_base64(16)
      end
      token
    end

end

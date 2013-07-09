Contacts::Application.routes.draw do
  resource :user, :except => [:new, :edit] do
    resources :contacts, :only => :index
    resources :favorites, :only => :index
  end

  resources :contacts, :except => [:new, :edit, :index]
  resources :favorites, :except => [:new, :edit, :index, :show, :update]
  resource :session, :only => [:create, :destroy]
end

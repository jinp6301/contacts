Contacts::Application.routes.draw do
  resource :user, :except => [:new, :edit] do
    resources :contacts, :only => :index
    resources :favorites, :only => :index
  end

  resources :contacts, :except => [:new, :edit, :index]
  resource :favorite, :only => [:create, :destroy]
  resource :session, :only => [:create, :destroy]
end

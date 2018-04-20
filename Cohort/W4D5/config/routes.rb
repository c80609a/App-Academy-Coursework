Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #TODO: set a root path


  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:show, :new, :create]

  resources :bands

end

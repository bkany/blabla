Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :carts, only: [:show]
  resources :items do 
  	resources :cart_items, only: [:create, :update, :destroy]
  end
  resources :users

  
end

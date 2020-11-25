Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#index'

  resources :carts, only: [:show]
  resources :items do
  	resources :cart_items, only: [:create, :update, :destroy]
  end

end

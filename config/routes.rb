Rails.application.routes.draw do
  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }

  root to: 'pages#index'
  
  resources :mon_panier, :controller => "carts", only: [:show], :as => "carts"
  resources :produit, :controller => "items", :as => "items" do
  	resources :cart_items, only: [:create, :update, :destroy]
  end
  resources :orders, only: [:create]
end
Rails.application.routes.draw do
  get 'orders/index'

  resource :cart, controller: "cart", only: [:show, :update, :edit] do
    member do
      post :add_item
      post :remove_item
      get :confirmation
      post :finish
    end
  end
  devise_for :users
  get "/orders", to: "orders#index"

  namespace :admin do
    resources :orders
    resources :addresses
    resources :shipping_typesr
    resources :line_items
      resources :books do
        post :import, on: :collection
      end
      resources :users
      root to: "books#index"
    end

  resources :books, only: [:show,:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
    root "books#index"
end

Rails.application.routes.draw do
  get 'cart/show'
  get 'cart/edit'
  get 'cart/confirmation'
  devise_for :users
  namespace :admin do
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

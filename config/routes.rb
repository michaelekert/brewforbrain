Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
      resources :books do
        post :import, on: :collection
      end

      root to: "books#index"
    end

  resources :books, only: [:show,:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
    root "books#index"
end

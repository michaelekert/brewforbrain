Rails.application.routes.draw do
  namespace :admin do
      resources :books

      root to: "books#index"
    end

  resources :books
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

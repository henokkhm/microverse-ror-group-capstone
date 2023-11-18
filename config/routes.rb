Rails.application.routes.draw do
  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  resources :users, only: [:show]
  resources :foods, only: [ :index, :new, :create, :destroy ]
  resources :recipes, except: [:edit] do
    resources :foods_recipe, only: [:new, :create, :destroy]
  end
    
  get "/public_recipes", to: "recipes#public_recipes"
  # get "/recipes/:id/add-ingredients", to: "recipes#ingredients", as: "add_ingredients"

  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root to: 'home#index'
end

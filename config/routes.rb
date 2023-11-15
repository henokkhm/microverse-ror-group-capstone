Rails.application.routes.draw do
  resources :foods, only: [ :index, :new, :create, :destroy ]
  resources :recipes, only: [ :index, :show, :new, :create, :destroy ]
    
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

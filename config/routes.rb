Rails.application.routes.draw do
  resources :genres

  get "movies/filter/:filter", to: "movies#index", as: :filtered_movies
  
  
  root "movies#index"
    
  resources :movies do
    resources :reviews
    resources :favorites
  end

  resources :users
  get "signup", to: "users#new"

  resource :session, only:[:new,:create, :destroy]
  get "signin", to: "sessions#new"


  
  # get "movies", to: "movies#index"
  # get "movies/:id", to: "movies#show", as: "movie"
  # get "movies/:id/edit", to: "movies#edit", as: "edit_movie"
  # patch "movies/:id", to: "movies#update"
  
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
end

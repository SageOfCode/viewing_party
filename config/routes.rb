Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root to: "welcome#index"

  get '/dashboard', to: "dashboard#index"

  get '/registration', to: 'user#new'
  post '/registration/new', to: 'user#create', as: :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#login'
  post '/user/login', to: 'sessions#login'
  post '/user/friends', to: 'user#friends'

  get '/discover', to: 'discover#index'

  get '/movies', to: 'movies#index'
  get '/movies/search', to: 'movies#search'
  get '/movies/:movie_api_id', to: 'movies#show'

  get '/party/:movie_id/new', to: 'party#new'
  post '/party/:movie_id/create', to: 'party#create'
end

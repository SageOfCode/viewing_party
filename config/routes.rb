Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get :root, to: "welcome#index"

  get '/dashboard', to: "dashboard#index"

  get '/registration', to: 'user#new'
  post '/registration/new', to: 'user#create', as: :users
end

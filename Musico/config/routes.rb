Rails.application.routes.draw do
  resources :songs
  root 'dashboard#index'
  get '/login' => 'authentication#login'
  get '/logout' => 'authentication#logout'
  post '/login' => 'authentication#validate'
  get '/signup' => 'authentication#new'
  post '/signup' => 'authentication#create'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

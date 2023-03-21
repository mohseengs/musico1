Rails.application.routes.draw do

  root 'dashboard#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'registrations#new'
  post '/signup' => 'registrations#create'
  delete '/logout' => 'sessions#logout'

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

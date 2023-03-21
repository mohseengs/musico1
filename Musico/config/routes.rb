Rails.application.routes.draw do

  root 'dashboard#index'

  get '/login' => 'sessions#new'
  get '/signup' => 'registrations#new'
  get '/logout' => 'sessions#logout'

  resource :sessions
  resource :registrations
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

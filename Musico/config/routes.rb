Rails.application.routes.draw do
  root 'dashboard#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'registrations#new'
  post '/signup' => 'registrations#create'
  delete '/logout' => 'sessions#logout'
  get 'search_user/:query' => 'songs#search_user', as: :search_user
  get 'search_song/:query' => 'playlist_songs#search_song', as: :search_song

  resources :users 
  resources :songs 
  resources :playlists do
    resources :playlist_songs , only: [:index , :new , :create , :destroy]
  end
  resources :likes, only: [:index, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

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
  resources :likes, only: [:index, :create]
  delete '/likes' => 'likes#destroy' , as: :unlike
  resources :song_queue , only: [:index , :update , :destroy]
  get 'change_song/:song_pointer' => 'song_queue#change_song' , as: :change_song
 
end

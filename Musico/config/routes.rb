Rails.application.routes.draw do
  root 'dashboard#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'registrations#new'
  post '/signup' => 'registrations#create'
  delete '/logout' => 'sessions#destroy'
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
  resources :histories , only: [:index , :update]
  get 'change_song/:song_pointer' => 'song_queue#change_song' , as: :change_song
  get 'play_playlist/:playlist_id' => 'song_queue#play_playlist' , as: :play_playlist
  get 'play_song/:song_id' => 'song_queue#play_song' , as: :play_song
  get '/search/:query' => 'search#search'
  get '/search/' => 'search#index'

  resources :follows, only: [:index, :create]
  delete '/follow' => 'follows#destroy' , as: :unfollow

end

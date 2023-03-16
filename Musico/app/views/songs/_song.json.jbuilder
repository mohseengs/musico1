json.extract! song, :id, :name, :language_id, :genres_id, :created_at, :updated_at
json.url song_url(song, format: :json)

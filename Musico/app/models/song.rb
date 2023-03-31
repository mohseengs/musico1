class Song < ApplicationRecord
  has_and_belongs_to_many :users , dependent: :destroy
  has_and_belongs_to_many :song_queues , dependent: :destroy
  has_and_belongs_to_many :playlists , dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :histories, as: :playable, dependent: :destroy
  belongs_to :language
  belongs_to :category
end

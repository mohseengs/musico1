class Song < ApplicationRecord
  has_one_attached :thumbnail
  has_one_attached :audio
  has_and_belongs_to_many :users , dependent: :destroy
  has_and_belongs_to_many :song_queues , dependent: :destroy
  has_and_belongs_to_many :playlists , dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_and_belongs_to_many :histories
  belongs_to :language
  belongs_to :category

  validates :audio, :thumbnail, :name, presence: true

  scope :search, -> (query){ where("name LIKE ?" , "%" + query + "%")} 

end

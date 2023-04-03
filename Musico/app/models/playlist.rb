class Playlist < ApplicationRecord
  has_one_attached :thumbnail
  has_and_belongs_to_many :songs , dependent: :destroy
  has_many :likes, as: :likeable , dependent: :destroy
  has_many :histories, as: :playable , dependent: :destroy
  belongs_to :user
end

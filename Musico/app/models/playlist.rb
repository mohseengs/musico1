class Playlist < ApplicationRecord
  has_one_attached :thumbnail
  has_and_belongs_to_many :songs , dependent: :destroy
  has_many :likes, as: :likeable , dependent: :destroy
  belongs_to :user

  validates :name , :thumbnail, presence: :true

  scope :search, -> (query){ where("name LIKE ?" , "%" + query + "%")} 

end

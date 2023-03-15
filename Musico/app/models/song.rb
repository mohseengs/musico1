class Song < ApplicationRecord
  has_and_belongs_to_many :users , dependent: :destroy
  belongs_to :language 
  belongs_to :category
end

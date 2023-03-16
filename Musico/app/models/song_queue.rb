class SongQueue < ApplicationRecord
  has_and_belongs_to_many :songs , dependent: :destroy
  belongs_to :user
end

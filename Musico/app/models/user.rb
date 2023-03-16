class User < ApplicationRecord
    has_and_belongs_to_many :songs
    validates :name, :email, :password, :dob, presence: :true
end


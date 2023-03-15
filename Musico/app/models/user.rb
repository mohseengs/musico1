class User < ApplicationRecord
    validates :name, :email, :password, :dob, presence: :true
end

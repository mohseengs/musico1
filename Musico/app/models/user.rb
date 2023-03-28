class User < ApplicationRecord
    has_secure_password
    EMAIL_REGEX = /\A[^@\s]+@[^@\s]+\z/
    validates :email, presence: true, uniqueness: true, format: { with: EMAIL_REGEX, message: 'Invalid email' }
    validates :name, :password, :dob, presence: :true
end

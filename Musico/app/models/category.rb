class Category < ApplicationRecord
    has_many :songs, dependent: :nullify
end

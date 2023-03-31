class Language < ApplicationRecord
    has_many :songs, dependent: :nullify
end

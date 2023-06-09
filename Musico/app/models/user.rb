class User < ApplicationRecord
    has_secure_password
    EMAIL_REGEX = /\A[^@\s]+@[^@\s]+\z/
    validates :email, presence: true, uniqueness: true, format: { with: EMAIL_REGEX, message: 'Invalid email' }
    validates :name, :password, :dob, presence: :true

    #follow
    has_many :follower_follows, foreign_key: :following_id, class_name: "Follow" , dependent: :destroy
    has_many :followers, through: :follower_follows, source: :follower
    has_many :following_follows, foreign_key: :follower_id, class_name: "Follow", dependent: :destroy
    has_many :followings, through: :following_follows, source: :following

    #like
    has_many :likes , dependent: :destroy

    #history
    has_many :histories , dependent: :destroy
    
    #songs
    has_and_belongs_to_many :songs, dependent: :destroy
   
    #song_queue
    has_one :song_queue ,  dependent: :destroy

    #group_sessions
    has_and_belongs_to_many :group_sessions , dependent: :destroy
    has_many :admin_for_group_sessions, foreign_key: 'group_admin_id', class_name: 'GroupSession'

    #notification
    has_many :notifications , dependent: :destroy

end


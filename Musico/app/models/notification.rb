class Notification < ApplicationRecord
  belongs_to :sender , class_name: "User"
  has_and_belongs_to_many :recievers, class_name: "User"

  enum status: { unread: 0, read: 1 }
  enum notifiable_type: { like: 0, follow: 1, session:2 }

end

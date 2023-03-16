class Notification < ApplicationRecord
  belongs_to :user
  enum status: { unread: 0, read: 1 }
  enum notifiable_type: { like: 0, follow: 1, session:2 }

end

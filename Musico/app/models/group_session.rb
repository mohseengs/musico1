class GroupSession < ApplicationRecord
  has_and_belongs_to_many :users , dependent: :destroy
  #admin who created session
  belongs_to :group_admin, class_name: 'User', foreign_key: :group_admin_id
end

class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :sender_id, null: false, foreign_key: true
      t.integer :notifiable_type, null: false
      t.integer :notifiable_id, null: false
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end

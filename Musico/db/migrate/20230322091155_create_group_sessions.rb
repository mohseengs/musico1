class CreateGroupSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :group_sessions do |t|
      #t.references :user, null: false, foreign_key: true
      t.references :group_admin, null: false, foreign_key: { to_table: :users }
      t.string :name

      t.timestamps
    end
  end
end

class CrerateJoinTableGroupSessionsAndUsers < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :group_sessions do |t|
      # t.index [:user_id, :group_session_id]
      # t.index [:group_session_id, :user_id]
    end
  end
end

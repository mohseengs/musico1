class CreateSongQueues < ActiveRecord::Migration[6.1]
  def change
    create_table :song_queues do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :current_pointter

      t.timestamps
    end
  end
end

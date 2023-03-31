class CreateJoinTableForSongsPalylist < ActiveRecord::Migration[6.1]
  def change
    create_join_table :songs, :playlists do |t|
      # t.index [:_id, :_id]
      # t.index [:_id, :_id]
    end
  end
end

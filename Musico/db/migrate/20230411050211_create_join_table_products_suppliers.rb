class CreateJoinTableProductsSuppliers < ActiveRecord::Migration[6.1]
  def change
    create_join_table :histories, :songs do |t|
      # t.index [:history_id, :song_id]
      # t.index [:song_id, :history_id]
    end
  end
end

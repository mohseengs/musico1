class CreateHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :histories do |t|
      t.references :user, null: false, foreign_key: true
      t.references :playable, polymorphic: true
      t.timestamps
    end
  end
end

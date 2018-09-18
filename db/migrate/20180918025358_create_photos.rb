class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.text :body
      t.integer :user_id, null: false
      t.integer :post_id
      t.timestamps
    end
    add_index :photos, :user_id
    add_index :photos, :post_id
  end
end

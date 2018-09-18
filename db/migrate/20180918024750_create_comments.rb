class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.references :commentable, polymorphic: true, index: true
      t.integer :user_id, null: false
      t.timestamps
    end
    add_index :comments, :user_id
  end
end

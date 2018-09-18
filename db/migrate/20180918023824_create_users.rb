class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :phone
      t.string :password_digest, null: false
      t.string :fname, null: false
      t.string :lname, null: false
      t.string :session_token, null: false
      t.date :dob, null: false
      t.boolean :admin, null: false, default: false
      t.string :gender
      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :phone, unique: true
  end
end

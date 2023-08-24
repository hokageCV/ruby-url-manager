class AddSchema < ActiveRecord::Migration[7.0]
 def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :password, null: false

      t.timestamps
    end

    create_table :shortened_urls do |t|
      t.string :original_url, null: false
      t.string :shortened_code
      t.integer :user_id, default: nil
      t.datetime :expires_at, default: nil

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :shortened_urls, :shortened_code, unique: true
    add_foreign_key :shortened_urls, :users, column: :user_id
  end
end

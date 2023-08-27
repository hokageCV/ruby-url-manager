class AddForeignKeyToUrls < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :shortened_urls, :users, column: :user_id
  end
end

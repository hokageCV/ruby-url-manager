class DeleteUserTable < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :shortened_urls, :users
  end
end

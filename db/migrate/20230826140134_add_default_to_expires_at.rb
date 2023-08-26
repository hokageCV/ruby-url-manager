class AddDefaultToExpiresAt < ActiveRecord::Migration[7.0]
  def change
    change_column :shortened_urls, :expires_at, :datetime, default: -> { "NOW() + INTERVAL '1 HOUR'" }
  end
end

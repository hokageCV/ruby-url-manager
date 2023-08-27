class RemoveDefaultExpiresAtFromShortenedUrls < ActiveRecord::Migration[7.0]
  def change
    change_column_default :shortened_urls, :expires_at, from: -> { "(now() + 'PT1H'::interval)" }, to: nil
  end
end

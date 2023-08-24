class ShortenedUrl < ApplicationRecord
    belongs_to :user, optional: true
  end
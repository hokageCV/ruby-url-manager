class User < ApplicationRecord
    has_many :shortened_urls
  end
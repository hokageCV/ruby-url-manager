namespace :delete_expired_urls do
    desc "Delete expired shortened URLs without a user_id"

    task :cleanup => :environment do
      cutoff_time = 1.day.ago
      ShortenedUrl.where(user_id: nil).where("created_at <= ?", cutoff_time).delete_all
    end
end

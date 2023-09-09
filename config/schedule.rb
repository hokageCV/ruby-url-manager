every 1.day, at: '2:00 am' do
    rake 'delete_expired_urls:cleanup'
end
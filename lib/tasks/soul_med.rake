namespace :soul_med do
  desc "Confirm Sidekiq is running"
  task :sidekiq_check do
    redis_info = Sidekiq.redis { |conn| conn.info }
    puts redis_info['connected_clients']
  end

  desc "Send messages to users"
  task :send_messages, [:timeOfDay] => :environment do |task, args|
    MessageSendAlgorithmWorker.perform_async(args.timeOfDay)
  end

end

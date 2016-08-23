namespace :soul_med do
  desc "Get the current time"
  task :get_time, [:name] => :environment do |task, args|
    TestWorker.perform_async(args.name)
  end

  desc "Send messages to users"
  task :send_sms, [:timeOfDay] => :environment do |task, args|
    SendsmsWorker.perform_async(args.timeOfDay)
  end

end

namespace :soul_med do
  desc "Get the current time"
  task :get_time, [:name] => :environment do |task, args|
    TestWorker.perform_async(args.name)
  end

end

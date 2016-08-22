namespace :soul_med do
  desc "Get the current time"
  task get_time: :environment do
    puts "Current time is: "
    puts Time.now
  end

end

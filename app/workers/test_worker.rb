class TestWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence do
	  hourly.minute_of_hour(30,31,32,33,34,35,36,37,38,39,40)
  end

  def perform
      puts "Name: quinn -- Time: #{Time.now}"
    end
end
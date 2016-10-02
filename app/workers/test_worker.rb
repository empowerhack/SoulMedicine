class TestWorker
  include Sidekiq::Worker
  
  def perform(name)
      logger.info "Name: #{name} -- Time: #{Time.now}"
      file = File.join(Rails.root, 'tmp', 'test.txt')
      File.open(file, "w+") do |f|
        f.write("Name: #{name} -- Time: #{Time.now}")
      end
    end
end
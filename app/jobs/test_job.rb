class TestJob < ActiveJob::Base
  def perform
    puts Time.now
  end
end
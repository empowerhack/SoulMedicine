class SendDailyMessagesWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false
  def perform(timeOfDay)
      logger.info "Starting with SendDailyMessagesWorker for #{timeOfDay} sms messages"
        send_messages(timeOfDay)
      logger.info "Finshed with SendDailyMessagesWorker"
  end
  
  def send_messages(timeOfDay)
    logger.info "Gathering all users with a #{timeOfDay} delivery time"
      users = User.joins(:user_preference).where(:user_preferences => {:delivery_time => timeOfDay}, :verified => true)
      users.each do |u|
        logger.info "Found User ##{u.id} - Mobile Number: #{u.mobile_number}"
        logger.info "Sending user to Courses Worker"
          GetActiveUserCoursesWorker.perform_async(u.id)
        logger.info "SendDailyMessagesWorker complete for User ##{u.id}"
      end
    logger.info "Finshed sending messages"
  end
  
end
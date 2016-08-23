class SendsmsWorker
  include Sidekiq::Worker
  def perform(timeOfDay)
      logger.info "Starting to send #{timeOfDay} sms messages"
  end
end
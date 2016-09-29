class SendTwilioMessageWorker
    include Sidekiq::Worker
    
    #Perform - external facing method
    def perform(message, to_number)
        logger.info "Sending message to #{to_number}"
        TwilioService.new({
            to: to_number,
            msg: message
        }).send_sms
    end
end
require 'twilio-ruby'

class TwilioService

  def initialize(params)
    @to = params[:to]
    @msg = params[:msg]
    @from = Rails.application.secrets.twilio_from
    @account_sid = Rails.application.secrets.twilio_account_sid
    @auth_token = Rails.application.secrets.twilio_auth_token
  end
  
  def send_sms
    begin
        twilio_rest_client.messages.create(
            :to => @to,
            :from => @from,
            :body => @msg
        )
    rescue Twilio::REST::RequestError => e
        flash[:error] = e
        redirect_to(controller: 'user', action: 'index')
        @user.destroy!
    end
  end
  
  def valid?
    begin
        response = twilio_lookup_client.phone_numbers.get(@to)
        response.phone_number #if invalid, throws an exception. If valid, no problems.
        return true
      rescue => e
        if e.code == 20404
          return false
        else
          raise e
      end
    end
  end
  
  private
  
  attr_reader :account_sid, :auth_token, :from, :to, :msg
  
  def twilio_rest_client
    Twilio::REST::Client.new account_sid, auth_token
  end
  
  def twilio_lookup_client
    Twilio::REST::LookupsClient.new(account_sid, auth_token)
  end
  
end
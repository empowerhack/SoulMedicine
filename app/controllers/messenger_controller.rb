class MessengerController < ApplicationController

  # This is the method used on User_controller

  def send_message
    @user = User.new(user_params)

    @country = Country.find(params[:country][:dial_code])
      @user.country_id = @country.id

    @language = Language.find(params[:language][:id])
      @user.language_id = @language.id
    @mobile_num = @user.mobile_number

    if @user.save
	    @pin = @user.pin

		    send_with_twilio(
          "+#{@country.dial_code}#{@mobile_num}",
          "You did it! Now to receive and save all this info #{@pin}"
        )
		    flash[:notice] = 'Check your phone'
	      session[:user_id] = @user.id
	      redirect_to(controller: 'pin', action: 'index')
    else
			flash[:error] = @user.errors.full_messages
			render 'user/index'
    end

  end

  private
  
  def send_with_twilio(_to, _body)
    TwilioService.new({
      to: _to,
      msg: _body
    }).send_sms
  end


  def user_params
	  params.require(:user).permit(:country_id, :language_id ,:mobile_number, :pin, :verify, :name, :email, :password, :password_confirmation)
  end

end

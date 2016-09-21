class PinController < ApplicationController

	layout 'site_base'
	
	def index
		@user = User.all
	end

  def verify
    @mobile_num = params[:mobile_number]
		@pin_int = params[:pin]
		pin = @pin_int.to_s
		@user = User.find_by_mobile_number(@mobile_num)

		if User.exists?(:mobile_number => @mobile_num, :pin => pin)
			if !@user.verified
				@user.verified = true
				@user.save
				flash[:success] = 'Account verified!'
				cookies[:current_user_id] = @user.id
				redirect_to(controller: 'user_preference', action: 'index')
			else
				flash[:error] = 'You have already registered'
				redirect_to(controller: 'user', action: 'index')
			end
		else
			flash[:error] = 'Wrong pin! Please try again'
			redirect_to( action: 'index')
		end
  end
end

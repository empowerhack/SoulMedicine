class UserPreferenceController < ApplicationController

	layout 'site_base'
	
	def index
		if cookies[:current_user_id]
			@user_id = cookies[:current_user_id]
			@user_preferences = UserPreference.find_by(user_id: @user_id)
		else
			redirect_to controller: 'user', action: 'index'
		end
	end

	def create
		redirect_to controller: 'user', action: 'index'
	end
	
	def update
		@user_id = cookies[:current_user_id]
		@user_preferences = UserPreference.find_by(user_id: @user_id)
    	# debugger
		
		@gender = params[:user_preference][:gender_attributes].present? ? Gender.find(params[:user_preference][:gender_attributes][:id]).id : 3
		@native = params[:user_preference][:native_language_attributes][:id].present? && !params[:user_preference][:native_language_attributes][:id].empty? ? Language.find(params[:user_preference][:native_language_attributes][:id]).id : nil
		@other_lang_one = params[:user_preference][:other_language_one_attributes][:id].present? && !params[:user_preference][:other_language_one_attributes][:id].empty? ? Language.find(params[:user_preference][:other_language_one_attributes][:id]).id : nil
		@other_lang_two = params[:user_preference][:other_language_two_attributes][:id].present? && !params[:user_preference][:other_language_two_attributes][:id].empty? ? Language.find(params[:user_preference][:other_language_two_attributes][:id]).id : nil
		@origin = params[:user_preference][:origin_country_attributes][:id].present? && !params[:user_preference][:origin_country_attributes][:id].empty? ? Country.find(params[:user_preference][:origin_country_attributes][:id]).id : nil
		@residence = params[:user_preference][:country_of_residence_attributes][:id].present? && !params[:user_preference][:country_of_residence_attributes][:id].empty? ? Country.find(params[:user_preference][:country_of_residence_attributes][:id]).id : nil
		
		completed = false
		UserPreference.transaction do
			@user_preferences.gender_id = @gender
			@user_preferences.native_language_id = @native
			@user_preferences.other_language_one_id = @other_lang_one
			@user_preferences.other_language_two_id = @other_lang_two
			@user_preferences.origin_country_id = @origin
			@user_preferences.country_of_residence_id = @residence
			
			@user_preferences.consent = params[:user_preference][:consent]
			@user_preferences.age = params[:user_preference][:age]
			@user_preferences.first_name = params[:user_preference][:first_name]
			@user_preferences.last_name = params[:user_preference][:last_name]
			@user_preferences.email = params[:user_preference][:email]
			@user_preferences.delivery_time = params[:user_preference][:delivery_time]
			@user_preferences.save!
			completed = true
		end
		if completed
			redirect_to controller: 'user_preference', action: 'index'
		else 
			render :action => :index 
		end
	end

	private

	def user_preference_params
		params.require(:user_preference).permit(
			:user_id,
			:delivery_time, 
			:consent, 
			:age, 
			:first_name, 
			:last_name, 
			:email, 
			:password_digest)
	end

end

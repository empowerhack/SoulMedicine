class UserPreferenceController < ApplicationController

	def index
		@user_preferences = UserPreference.new
	end

	def create
		@gender = Gender.find(params[:gender][:id])
		@native = Language.find(params[:language][:id])
		@other_lang_one = Language.find(params[:language][:id1])
		@other_lang_two = Language.find(params[:language][:id2])
		@origin = Country.find(params[:country][:id])
		@residence = Country.find(params[:country][:id1])
		@user_preferences = UserPreference.new(user_preference_params)
		@user_preferences.user_id = cookies[:current_user_id]
		@user_preferences.gender_id = @gender.id
		@user_preferences.native_language_id = @native.id
		@user_preferences.other_language_one_id = @other_lang_one.id
		@user_preferences.other_language_two_id = @other_lang_two.id
		@user_preferences.origin_country_id = @origin.id
		@user_preferences.country_of_residence_id = @residence.id
		@user_preferences.consent = params[:consent]
		@user_preferences.age = params[:age]
		@user_preferences.message_service_one_id = params[:sms]
		@user_preferences.message_service_two_id = params[:email]
		@user_preferences.first_name = params[:first_name]
		@user_preferences.last_name = params[:last_name]
		@user_preferences.email = params[:email]
		@user_preferences.password = 'hello'
		@user_preferences.password_confirmation = 'hello'

		@user_preferences.save!
			redirect_to controller: 'user', action: 'index'
	end

	private

	def user_preference_params
		params.require(:user_preference).permit(:user_id, :gender_id, :native_language_id, :other_language_one_id,
		:other_language_two_id, :origin_country_id, :country_of_residence_id, :consent, :age, :message_service_one_id,
		:message_service_two_id, :first_name, :last_name, :email, :password, :password_confirmation)
	end

end

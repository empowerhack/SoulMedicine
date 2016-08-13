class PagesController < ApplicationController

	layout 'logged_out'

	def show
		if valid_page?
			render(template: "pages/#{params[:page]}")
		else
			render(file: "public/404", status: :not_found)
		end
	end

	private

	def valid_page?
		File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:page]}.html.erb"))
	end
end

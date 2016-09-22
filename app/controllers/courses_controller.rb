class CoursesController < ApplicationController

	layout 'site_base'
	
	def index
	    @courses = Course.where(:is_active => true).all
	end
	
end

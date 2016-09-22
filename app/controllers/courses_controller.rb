class CoursesController < ApplicationController

	layout 'site_base'
	
	def index
	    @courses = Course.all
	end
	
end

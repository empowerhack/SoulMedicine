class CoursesController < ApplicationController

	layout 'site_base_with_breadcrumbs'
	
	semantic_breadcrumb 'Courses', :courses_path
	
	def index
	    @courses = Course.where(:is_active => true).all
	end
	
	def show
		@course_id = params[:id]
		@course = Course.find(@course_id)
		@subjects = SubjectMatter.where(:course_id => @course_id, :is_active => true)
		
		semantic_breadcrumb @course.name, courses_path
	end
	
	def lesson
		@lesson_id = params[:id]
		@lesson = Lesson.find(@lesson_id)
		@lesson_translations = LessonTranslation.where(:lesson_id => @lesson_id)
		@course = @lesson.course
		@subject = @lesson.subject_matter
		
		semantic_breadcrumb @course.name, course_path(@course.id)
		semantic_breadcrumb @subject.name, course_path(@course.id)
		semantic_breadcrumb @lesson.name, lesson_path(@lesson_id)
	end
	
end

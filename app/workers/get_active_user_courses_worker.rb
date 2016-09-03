class GetActiveUserCoursesWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false
  def perform(user)
      logger.info "Starting with GetActiveUserCoursesWorker for User ##{user}"
        get_courses(user)
      logger.info "Finshed with GetActiveUserCoursesWorker"
  end
  
  def get_courses(user)
    logger.info "Gathering courses for user #{user}"
      user_courses = UserCourse.where(:user_id => user)
      user_courses.each do |uc|
        logger.info "Found Course ##{uc.course_id}"
        logger.info "Course is complete? #{uc.is_complete}"
          if !uc.is_complete
            logger.info "Course not complete. Finding if a lesson has been sent before"
          end
      end
    logger.info "Finshed gathering courses"
  end
  
end
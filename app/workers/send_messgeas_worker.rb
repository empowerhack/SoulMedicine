class SendMessageWorker
    include Sidekiq::Worker

    #Sidekiq Options
    sidekiq_options :retry => false

    #Perform - external facing method
    def perform(timeOfDay)
        logger.info "Starting with SendDailyMessagesWorker for #{timeOfDay} sms messages"
            send_messages(timeOfDay)
        logger.info "Finshed with SendDailyMessagesWorker"
    end

    #Send Messages
    ## Method to run through the messages algorithm
    def send_messages(timeOfDay)
        logger.info "Gathering all users with a #{timeOfDay} delivery time"
        users = findUsersToSendMessagesTo(timeOfDay)
        users.each do |u|
            user_courses = findUserActiveCourse(u.id)
            user_courses.each do |uc|
                if !uc.is_complete
                    user_lesson_completions = findUserLessonCompletionForCourse(u.id, uc.id)
                    if user_lesson_completions.empty?
                        #Send the first lesson of the first subject of the course
                    else
                        
                    end
                else
                    logger.info "Course is complete. No further action is needed"
                end
            end
        end
        logger.info "Finshed sending messages"
    end

    def findUsersToSendMessagesTo(timeOfDay)
        return User.joins(:user_preference).where(:user_preferences => {:delivery_time => timeOfDay}, :verified => true)
    end

    def findUserActiveCourse(user_id)
        return UserCourse.where(:user_id => user_id, :is_complete => false)
    end

    def findUserLessonCompletions(user_id, course_id)
        return LessonCompletion.where(:user_id => user_id, :course_id => course_id)
    end
    
end
class MessageSendAlgorithmWorker
    include Sidekiq::Worker
    # include Sidetiq::Schedulable

    # recurrence do
    #     hourly.minute_of_hour(30,31,32,33,34,35,36,37,38,39,40)
    # end

    #Sidekiq Options
    sidekiq_options :retry => false

    #Perform - external facing method
    def perform(timeOfDay)
        logger.info "Starting sending messages for #{timeOfDay}"
            users = findUsers(timeOfDay)
            send_messages(users)
        logger.info 'Finished sending messages'
    end

    #Send Messages
    ## Method to run through the messages algorithm
    def send_messages(users)
        logger.info "Gathering all users"
        users.each do |u|
            logger.info "Starting algorithm for user_id: #{u.id}"
            logger.info "Finding User's courses"
            user_courses = findUserActiveCourse(u.id) # Get the Course(s) that the user is subscribed to(returns array)
            user_courses.each do |uc|
                logger.info "Course found. Course_id: #{uc.id}"
                logger.info "Finding lessons that the user has completed for this course"
                user_lesson_completions = findUserLessonCompletions(u.id, uc.id) #Get the Lessons that the user has completed
                # If the User has not yet started on the course,
                # then send the first lesson of the first
                # subject on that course
                if user_lesson_completions.empty?
                    logger.info "User has not completed any lessons for this course"
                    logger.info "Sending the first lesson of the first subject"
                    subject_matter = Course.find(uc.id).subject_matters.first_active
                        if subject_matter.present?
                            lesson = SubjectMatter.find(subject_matter.id).lesson.first_active
                            logger.info "Sending lesson #{lesson.name} for subject: #{lesson.subject_matter.name}"
                        else
                            logger.info "There are no subjects assigned to this course"
                        end
                else
                    last_lesson_sent = LessonCompletion.where(:user_id => u.id, :course_id => uc.id).order('created_at desc').first
                    # If the last lesson that was sent is not the last 
                    # lesson in the subject, then send the next
                    # lesson, otherwise proceed to next check
                    if last_lesson_sent.lesson.next.present?
                        logger.info "Sending the next lesson in the subject"
                        lesson = last_lesson_sent.lesson.next
                        logger.info "Sending lesson #{lesson.name} for subject: #{lesson.subject_matter.name}"
                    else 
                        # If the last lesson sent was the last lesson in the
                        # subject, then move on to the next subject's
                        # first lesson
                        if last_lesson_sent.subject_matter.next.present?
                            logger.info "Starting the next subject on this course for this user"
                            lesson = last_lesson_sent.subject_matter.next.lesson.first_active
                            logger.info "Sending lesson #{lesson.name} for subject: #{lesson.subject_matter.name}"
                        else
                            logger.info "Course has been completed by the user"
                            user_course = UserCourse.find(uc.id)
                            user_course.is_complete = true
                            user_course.save
                        end
                    end
                end
            end
        logger.info "Finished sending messages"
        end
    end

    private
    
    def findUsers(timeOfDay)
        case timeOfDay
        when "morning"
            User.morning_users
        when "afternoon"
            User.afternoon_users
        when "evening"
            User.evening_users
        else
            User.where('verified = true')
        end
    end

    def findUserActiveCourse(user_id)
        UserCourse.where(:user_id => user_id, :is_complete => false)
    end

    def findUserLessonCompletions(user_id, course_id)
        LessonCompletion.where(:user_id => user_id, :course_id => course_id)
    end
    
end
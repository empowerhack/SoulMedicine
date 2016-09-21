class SendMessageWorker
    include Sidekiq::Worker
    include Sidetiq::Schedulable

    recurrence do
        hourly.minute_of_hour(30,31,32,33,34,35,36,37,38,39,40)
    end

    #Sidekiq Options
    sidekiq_options :retry => false

    #Perform - external facing method
    def perform
        logger.info 'Starting my morning message sending schedual!'
            send_messages
        logger.info 'Finished sending morning messages'
    end

    #Send Messages
    ## Method to run through the messages algorithm
    def send_messages
        puts "Gathering all users with a morning delivery time"
        users = User.morning_users # Select all users with a morning delivery time (returns array)
        users.each do |u|
            user_courses = findUserActiveCourse(u.id) # Get the Course(s) that the user is subscribed to(returns array)
            user_courses.each do |uc|
                user_lesson_completions = findUserLessonCompletions(u.id, uc.id) #Get the Lessons that the user has completed
                    if user_lesson_completions.empty?
                        subject_matter = SubjectMatter.where(course_id: uc.id, is_active: true).order(:order)
                        subject_matter.each do |sm|
                            lesson = Lesson.where(subject_matter: sm.id, is_approved: true).order(:order)
                                lesson.each do |l|
                                    lesson_text = LessonTranslation.where(lesson_id: l, language_id: u.language, is_approved: true)
                                        lesson_text.each do |lt|
                                            puts lt.translation
                                        end
                                end
                        end
                    end
            end
        puts "Finished sending messages"
        end
    end

    private

    def findUserActiveCourse(user_id)
        UserCourse.where(:user_id => user_id, :is_complete => false)
    end

    def findUserLessonCompletions(user_id, course_id)
        LessonCompletion.where(:user_id => user_id, :course_id => course_id)
    end
    
end
class CalculateLessonTranslationsWorker
    include Sidekiq::Worker
    
    #Perform - external facing method
    def perform(user_id, lesson_id)
        logger.info "Finding Lesson Translations for user_id: #{user_id} and lesson_id: #{lesson_id}"
        user = User.find(user_id)
        lesson = Lesson.find(lesson_id)
        if user.present? && lesson.present?
            primary = lesson.lesson_translation.where(:language_id => user.language_id).first
            if primary.present?
                url = ENV["BASE_URL"]
                message = "Here is your lesson for the day! \n "
                message << primary.translation.truncate(100)
                message << "\n The full lesson details can be found here: #{url}lesson/#{lesson.id}"
                send_with_twilio("+#{user.country.dial_code}#{user.mobile_number}", message)
            end
            lesson_completion = LessonCompletion.create!(lesson_id: lesson_id, user_id: user_id, subject_matter_id: lesson.subject_matter.id, course_id: lesson.course.id )
        end
    end
    
    def send_with_twilio(_to, _body)
        SendTwilioMessageWorker.perform_async(_body, _to)
    end
end
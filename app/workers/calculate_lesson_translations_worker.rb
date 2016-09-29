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
                message = "Here is your lesson for the day! \n "
                message << primary.truncate(100)
                send_with_twilio("+#{user.country.dial_code}#{user.mobile_number}", message)
            end
        end
    end
    
    def send_with_twilio(_to, _body)
        SendTwilioMessageWorker.perform_async(_body, _to)
    end
end
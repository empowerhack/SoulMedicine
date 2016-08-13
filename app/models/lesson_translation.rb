class LessonTranslation < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :language
end

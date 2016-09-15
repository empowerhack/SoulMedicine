class LessonTranslation < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :language

  validates_presence_of :translation, message: "can't be blank"
  validates_presence_of [:lesson_id, :language_id]
  validates_uniqueness_of :lesson_id, :scope => :language_id, on: :create, message: "must be unique"

end

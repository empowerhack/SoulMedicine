class LessonCompletion < ActiveRecord::Base

  validates_presence_of [:user_id, :lesson_id]
  
  belongs_to :lesson
  belongs_to :user
end

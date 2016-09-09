class LessonCompletion < ActiveRecord::Base

  validates_presence_of [:user_id, :lesson_id, :subject_matter_id, :course_id]
  
  belongs_to :lesson
  belongs_to :subject_matter
  belongs_to :course
  belongs_to :user
end

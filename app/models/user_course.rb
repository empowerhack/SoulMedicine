class UserCourse < ActiveRecord::Base
    validates_presence_of [:user_id, :course_id]
  
    belongs_to :course
    belongs_to :user

    def course_name
        "hello"
    end
end

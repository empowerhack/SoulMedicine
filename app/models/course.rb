class Course < ActiveRecord::Base
  has_many :subject_matters, :dependent => :destroy do
    def active
      where(:is_active => true)
    end
    def first_active
      where(:is_active => true).order(order: :asc).first
    end
  end
  has_many :lessons, :through => :subject_matters do
    def approved
      where(:is_approved => true, :subject_matters => {:is_active => true})
    end
  end
  has_many :user, :through => :user_courses
  has_many :user_courses

  accepts_nested_attributes_for :user_courses
  accepts_nested_attributes_for :subject_matters, :allow_destroy => true
  
  
end

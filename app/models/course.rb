class Course < ActiveRecord::Base
  has_many :subject_matters, :dependent => :destroy
  has_many :lessons, :through => :subject_matters
  has_many :user, :through => :user_courses
  has_many :user_courses

  accepts_nested_attributes_for :user_courses
  accepts_nested_attributes_for :subject_matters, :allow_destroy => true
  
end

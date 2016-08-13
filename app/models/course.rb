class Course < ActiveRecord::Base
  has_many :subject_matters, :dependent => :destroy
  has_many :lessons, :through => :subject_matters
end

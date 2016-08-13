class SubjectMatter < ActiveRecord::Base
  belongs_to :course
  has_many :lesson, :dependent => :destroy
  # has_many :lesson_translation, :through => :lesson
  
  validates_numericality_of :order
end

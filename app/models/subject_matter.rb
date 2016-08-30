class SubjectMatter < ActiveRecord::Base
  belongs_to :course
  has_many :lesson, :dependent => :destroy do
    def first_active
      where(:is_approved => true).order(order: :asc).first
    end
  end
  # has_many :lesson_translation, :through => :lesson
  
  accepts_nested_attributes_for :lesson, :allow_destroy => true
  
  validates_numericality_of :order
	
	def to_s
		name
	end
	
end

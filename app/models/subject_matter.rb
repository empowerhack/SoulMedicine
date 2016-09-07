class SubjectMatter < ActiveRecord::Base
  belongs_to :course
  has_many :lesson, :dependent => :destroy do
    def first_active
      where(:is_approved => true).order(order: :asc).first
    end
  end
  # has_many :lesson_translation, :through => :lesson
  
  accepts_nested_attributes_for :lesson, :allow_destroy => true
  
  validates_presence_of :name, message: "can't be blank"
  validates_presence_of :description, message: "can't be blank"
  validates_presence_of :order, message: "can't be blank"
  validates_presence_of :is_active, message: "can't be blank"
  validates_presence_of :course_id, message: "can't be blank"
  validates_uniqueness_of [:name], :scope => :course_id, on: :create, message: "and course combo already exists"
  validates_numericality_of :order
	
	def to_s
		name
	end
	
end

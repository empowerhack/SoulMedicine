class User < ActiveRecord::Base

	belongs_to :country
  belongs_to :language
  has_one :user_preference
  has_many :user_courses
  has_many :courses, :through => :user_courses
  has_many :lesson_completions
  has_many :completed_lessons, :through => :lesson_completions, :source => :lesson

  accepts_nested_attributes_for :user_preference, :allow_destroy => true
  accepts_nested_attributes_for :user_courses, :allow_destroy => true
  
  def to_s
    mobile_number
  end

  before_validation :create_pin

  validates_uniqueness_of :mobile_number
  validates_presence_of :country_id, :mobile_number, :language_id

  after_create :load_user_extras
  
  def load_user_extras
    UserPreference.create(user_id: self.id)
    courses = Course.where :is_active => true
    courses.each do |c|
      UserCourse.create(user_id: self.id, course_id: c.id, is_complete: false)
    end
  end

  private
  # Generates pin
  def create_pin
		if self.pin.blank?
	    pin_string = rand.to_s[2..6]
	    pin = pin_string.to_i
	    self.pin = pin
		end
  end

end

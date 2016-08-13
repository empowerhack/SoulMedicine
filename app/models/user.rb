class User < ActiveRecord::Base

	belongs_to :country
  belongs_to :language
  has_one :user_preference
  has_many :lesson_completions
  has_many :completed_lessons, :through => :lesson_completions, :source => :lesson

  accepts_nested_attributes_for :user_preference
  
  # has_settings do |t|
	 #  t.key :religion
  # end

  before_validation :create_pin

  validates_uniqueness_of :mobile_number
  validates_presence_of :country_id, :mobile_number, :language_id

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

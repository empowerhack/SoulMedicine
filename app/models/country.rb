class Country < ActiveRecord::Base
  has_many :users
  has_many :user_preferences

  validates_presence_of :name

  # scope :search, lambda {|search|
  #   where(["name LIKE ?", "%#{search}%"])
  # }
end

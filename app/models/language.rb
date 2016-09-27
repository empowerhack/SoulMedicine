class Language < ActiveRecord::Base
  has_many :users
  has_many :lesson_translations
  has_many :user_preferences

  validates_presence_of :name
  validates_presence_of :locale
end

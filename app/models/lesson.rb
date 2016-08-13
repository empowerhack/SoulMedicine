class Lesson < ActiveRecord::Base
  belongs_to :subject_matter
  has_one :course, :through => :subject_matter
  has_many :lesson_translation, :dependent => :destroy
  has_many :lesson_completions, :dependent => :destroy
  has_many :completed_users, :through => :lesson_completions, :source => :user
  
  validates_numericality_of :order
    
  after_create :load_translations
  
  def load_translations
      langs = Language.where :is_active => true
      langs.each do |l|
          LessonTranslation.create(lesson_id: self.id, language_id: l.id, translation: " ")
      end
  end
  
end

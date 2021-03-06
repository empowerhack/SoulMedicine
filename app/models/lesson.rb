class Lesson < ActiveRecord::Base
  belongs_to :subject_matter
  has_one :course, :through => :subject_matter
  has_many :lesson_translation, :dependent => :destroy
  has_many :lesson_completions, :dependent => :destroy
  has_many :completed_users, :through => :lesson_completions, :source => :user
  
  validates_presence_of :name, message: "can't be blank"
  validates_presence_of :order, message: "can't be blank"
  validates_presence_of :subject_matter_id, message: "can't be blank"
  validates_uniqueness_of :name, :scope => :subject_matter_id, on: :create, message: "already exists for subject matter"
  validates_numericality_of :order

  accepts_nested_attributes_for :lesson_translation, :allow_destroy => true
    
  after_create :load_translations
  
  def load_translations
      langs = Language.all
      langs.each do |l|
          LessonTranslation.create(lesson_id: self.id, language_id: l.id, translation: "No Translation Yet.")
      end
  end
  
  def next
    subject_matter.lesson.where("lessons.order > ?", order).first
  end
  
  def prev
    subject_matter.lesson.where("lessons.order < ?", order).last
  end
  
end

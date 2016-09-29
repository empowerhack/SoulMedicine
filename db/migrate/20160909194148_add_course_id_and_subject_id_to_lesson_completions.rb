class AddCourseIdAndSubjectIdToLessonCompletions < ActiveRecord::Migration
  def change
    add_reference :lesson_completions, :subject_matter, foreign_key: true
    add_reference :lesson_completions, :course, foreign_key: true
  end
end

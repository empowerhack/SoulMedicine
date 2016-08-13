class CreateLessonTranslations < ActiveRecord::Migration
  def up
    create_table :lesson_translations do |t|
      t.references :lesson
      t.references :language
      t.text :translation
      t.boolean :is_approved, default: false
      t.timestamps null: false
    end
    add_index :lesson_translations, ["lesson_id", "language_id"], unique: true
  end

  def down
    drop_table :lesson_translations
  end
end

class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.references :subject_matter, index: true, foreign_key: true
      t.string :name
      t.integer :order, null: false
      t.boolean :is_approved, default: false, null: false

      t.timestamps null: false
    end
  end
end

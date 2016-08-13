class CreateSubjectMatters < ActiveRecord::Migration
  def up
    create_table :subject_matters do |t|
      t.string :name, null: false
      t.text :description
      t.integer :order, null: false
      t.boolean :is_active, default: true, null: false
      t.references :course, foreign_key: true
      t.timestamps null: false
    end
    add_index :subject_matters, [:course_id]
  end

  def down
    drop_table :subject_matters
  end
end

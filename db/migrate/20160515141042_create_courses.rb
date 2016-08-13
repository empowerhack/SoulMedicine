class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.integer :order
      t.boolean :is_active, default: true, null: false

      t.timestamps null: false
    end
  end
end

class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :iso_code
      t.integer :dial_code
      t.boolean :is_active, default: true, null: false
      t.timestamps null: false
    end
  end
end

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :mobile_number, limit: 8
      t.string :pin
      t.boolean :verified
      t.references :country
      t.references :language
      t.timestamps null: false
    end
    add_index :users, [:country_id, :language_id]
  end
end

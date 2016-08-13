class CreateMessageServices < ActiveRecord::Migration
  def change
    create_table :message_services do |t|
      t.string :service
      t.boolean :is_active, default: true, null: false
      t.timestamps null: false
    end
  end
end

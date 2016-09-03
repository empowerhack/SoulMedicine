class AddDeliveryTimeToUserPreferences < ActiveRecord::Migration
  def change
    add_column :user_preferences, :delivery_time, :string, null: true, default: "morning"
  end
end

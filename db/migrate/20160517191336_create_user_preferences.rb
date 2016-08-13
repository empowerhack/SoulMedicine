class CreateUserPreferences < ActiveRecord::Migration
  def change
    create_table :user_preferences do |t|
      t.references :user, null: false
      t.references :gender, null: false , default: 3
      t.references :native_language, null: false
      t.references :other_language_one
      t.references :other_language_two
      t.references :origin_country, null: false
      t.references :country_of_residence
      t.boolean :consent, null: false, default: false
      t.date :age
      t.references :message_service_one, null: false, default: 1
      t.references :message_service_two
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.timestamps null: false
    end
    add_index :user_preferences, ['user_id', 'gender_id']
    add_index :user_preferences, ['native_language_id']
    add_index :user_preferences, ['other_language_one_id']
    add_index :user_preferences, ['other_language_two_id']
    add_index :user_preferences, ['origin_country_id']
    add_index :user_preferences, ['country_of_residence_id']
    add_index :user_preferences, ['message_service_one_id']
    add_index :user_preferences, ['message_service_two_id']
  end
end

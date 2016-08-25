class CreateUserPreferences < ActiveRecord::Migration
  def change
    create_table :user_preferences do |t|
      t.references :user, null: false
      t.references :gender, null: true , default: 3
      t.references :native_language, null: true
      t.references :other_language_one, null: true
      t.references :other_language_two, null: true
      t.references :origin_country, null: true
      t.references :country_of_residence, null: true
      t.boolean :consent, null: false, default: false
      t.date :age, null: true
      t.references :message_service_one, null: true, default: 1
      t.references :message_service_two, null: true
      t.string :first_name, null: true
      t.string :last_name, null: true
      t.string :email, null: true
      t.string :password_digest, null: true
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

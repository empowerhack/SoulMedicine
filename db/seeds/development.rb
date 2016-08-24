# ADMIN
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', role: 'admin')
AdminUser.create!(email: 'superuser@example.com', password: 'password', password_confirmation: 'password', role: 'superuser')
AdminUser.create!(email: 'courseuser@example.com', password: 'password', password_confirmation: 'password', role: 'courseuser')
AdminUser.create!(email: 'translator@example.com', password: 'password', password_confirmation: 'password', role: 'translator')
AdminUser.create!(email: 'user@example.com', password: 'password', password_confirmation: 'password', role: 'user')

#COURSES
Course.create!(name: "Biology", description: "This is the biology course", order: 1, is_active: true)
Course.create!(name: "Anotomy", description: "This is the anatomy course", order: 2, is_active: true)
Course.create!(name: "Astronomy", description: "This is the astronomy course", order: 3, is_active: false)

#USERS
User.create!(mobile_number: 1234567890, pin: "98765", verified: true, country_id: Country.where(:iso_code => "gb").first.id, language_id: Language.where(:name => "English").first.id )
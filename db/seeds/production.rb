# ADMIN
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', role: 'admin')

# Biology Course
Course.create!(name: "Biology", description: "The Biology course is designed to teach all about the human biology, from anatomy all the way to circulation and everything in between", order: 1, is_active: true)

    SubjectMatter.create!(name: "Introduction Anatomy",description: "Introduction Anatomy",order: 1,is_active: true,course_id: Course.where(:name => "Biology").first.id    )
    SubjectMatter.create!(name: "Bones",description: "Bones",order: 2,is_active: true,course_id: Course.where(:name => "Biology").first.id)
    SubjectMatter.create!(name: "Muscles",description: "Muscles",order: 3,is_active: true,course_id: Course.where(:name => "Biology").first.id)
    SubjectMatter.create!(name: "Hormones / Glands",description: "Hormones / Glands",order: 4,is_active: true,course_id: Course.where(:name => "Biology").first.id)
    SubjectMatter.create!(name: "Reproduction I",description: "Reproduction I",order: 5,is_active: true,course_id: Course.where(:name => "Biology").first.id)
    SubjectMatter.create!(name: "Reproduction II",description: "Reproduction II",order: 6,is_active: true,course_id: Course.where(:name => "Biology").first.id)
    SubjectMatter.create!(name: 'Digestive system',description: 'Digestive system',order: 7,is_active: true,course_id: Course.where(:name => 'Biology').first.id)
    SubjectMatter.create!(name: 'Metabolism control',description: 'Metabolism control',order: 8,is_active: true,course_id: Course.where(:name => 'Biology').first.id)
    SubjectMatter.create!(name: 'Senses I',description: 'Senses I',order: 9,is_active: true,course_id: Course.where(:name => 'Biology').first.id)
    SubjectMatter.create!(name: 'Senses II',description: 'Senses II',order: 10,is_active: true,course_id: Course.where(:name => 'Biology').first.id)
    SubjectMatter.create!(name: 'Neurobiology ',description: 'Neurobiology ',order: 11,is_active: true,course_id: Course.where(:name => 'Biology').first.id)
    SubjectMatter.create!(name: 'Circulation / heart',description: 'Circulation / heart',order: 12,is_active: true,course_id: Course.where(:name => 'Biology').first.id)

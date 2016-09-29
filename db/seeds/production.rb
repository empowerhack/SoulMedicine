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
    
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Introduction Anatomy').first.id, name: 'Day 1', order: '1')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Introduction Anatomy').first.id, name: 'Day 2', order: '2')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Introduction Anatomy').first.id, name: 'Day 3', order: '3')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Introduction Anatomy').first.id, name: 'Day 4', order: '4')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Introduction Anatomy').first.id, name: 'Day 5', order: '5')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Introduction Anatomy').first.id, name: 'Day 6', order: '6')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Introduction Anatomy').first.id, name: 'Day 7', order: '7')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Bones').first.id, name: 'Day 8', order: '1')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Bones').first.id, name: 'Day 9', order: '2')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Bones').first.id, name: 'Day 10', order: '3')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Bones').first.id, name: 'Day 11', order: '4')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Bones').first.id, name: 'Day 12', order: '5')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Bones').first.id, name: 'Day 13', order: '6')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Bones').first.id, name: 'Day 14', order: '7')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Muscles').first.id, name: 'Day 15', order: '1')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Muscles').first.id, name: 'Day 16', order: '2')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Muscles').first.id, name: 'Day 17', order: '3')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Muscles').first.id, name: 'Day 18', order: '4')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Muscles').first.id, name: 'Day 19', order: '5')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Muscles').first.id, name: 'Day 20', order: '6')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Muscles').first.id, name: 'Day 21', order: '7')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Hormones / glands').first.id, name: 'Day 22', order: '1')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Hormones / glands').first.id, name: 'Day 23', order: '2')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Hormones / glands').first.id, name: 'Day 24', order: '3')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Hormones / glands').first.id, name: 'Day 25', order: '4')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Hormones / glands').first.id, name: 'Day 26', order: '5')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Hormones / glands').first.id, name: 'Day 27', order: '6')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Hormones / glands').first.id, name: 'Day 28', order: '7')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Reproduction I').first.id, name: 'Day 29', order: '8')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Reproduction I').first.id, name: 'Day 30', order: '1')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Reproduction I').first.id, name: 'Day 31', order: '2')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Reproduction I').first.id, name: 'Day 32', order: '3')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Reproduction I').first.id, name: 'Day 33', order: '4')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Reproduction I').first.id, name: 'Day 34', order: '5')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Reproduction I').first.id, name: 'Day 35', order: '6')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Reproduction II').first.id, name: 'Day 36', order: '1')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Reproduction II').first.id, name: 'Day 37', order: '2')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Reproduction II').first.id, name: 'Day 38', order: '3')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Reproduction II').first.id, name: 'Day 39', order: '4')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Reproduction II').first.id, name: 'Day 40', order: '5')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Reproduction II').first.id, name: 'Day 41', order: '6')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Reproduction II').first.id, name: 'Day 42', order: '7')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Digestive system').first.id, name: 'Day 44', order: '1')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Digestive system').first.id, name: 'Day 45', order: '2')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Digestive system').first.id, name: 'Day 46', order: '3')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Digestive system').first.id, name: 'Day 47', order: '4')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Digestive system').first.id, name: 'Day 48', order: '5')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Digestive system').first.id, name: 'Day 49', order: '6')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Metabolism control').first.id, name: 'Day 50', order: '1')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Metabolism control').first.id, name: 'Day 51', order: '2')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Metabolism control').first.id, name: 'Day 52', order: '3')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Metabolism control').first.id, name: 'Day 53', order: '4')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Metabolism control').first.id, name: 'Day 54', order: '5')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Metabolism control').first.id, name: 'Day 55', order: '6')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Metabolism control').first.id, name: 'Day 56', order: '7')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Senses I').first.id, name: 'Day 57', order: '1')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Senses I').first.id, name: 'Day 58', order: '2')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Senses I').first.id, name: 'Day 59', order: '3')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Senses I').first.id, name: 'Day 60', order: '4')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Senses I').first.id, name: 'Day 61', order: '5')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Senses I').first.id, name: 'Day 62', order: '6')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Senses I').first.id, name: 'Day 63', order: '7')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Senses II').first.id, name: 'Day 64', order: '1')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Senses II').first.id, name: 'Day 65', order: '2')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Senses II').first.id, name: 'Day 66', order: '3')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Senses II').first.id, name: 'Day 67', order: '4')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Senses II').first.id, name: 'Day 68', order: '5')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Senses II').first.id, name: 'Day 69', order: '6')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Senses II').first.id, name: 'Day 70', order: '7')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Neurobiology ').first.id, name: 'Day 71', order: '1')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Neurobiology ').first.id, name: 'Day 72', order: '2')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Neurobiology ').first.id, name: 'Day 73', order: '3')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Neurobiology ').first.id, name: 'Day 74', order: '4')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Neurobiology ').first.id, name: 'Day 75', order: '5')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Neurobiology ').first.id, name: 'Day 76', order: '6')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Neurobiology ').first.id, name: 'Day 77', order: '7')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Circulation / heart').first.id, name: 'Day 78', order: '1')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Circulation / heart').first.id, name: 'Day 79', order: '2')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Circulation / heart').first.id, name: 'Day 80', order: '3')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Circulation / heart').first.id, name: 'Day 81', order: '4')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Circulation / heart').first.id, name: 'Day 82', order: '5')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Circulation / heart').first.id, name: 'Day 83', order: '6')
    Lesson.create!(subject_matter_id: SubjectMatter.where(:name => 'Circulation / heart').first.id, name: 'Day 84', order: '7')

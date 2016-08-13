ActiveAdmin.register Lesson do

    menu false

    permit_params do
        permitted = [:subject_matter_id, :name, :order]
        permitted << :is_approved if ['admin', 'superuser', 'courseuser'].include? current_admin_user.role
        permitted
    end
    
    
    index do
        selectable_column
        column "Course" do |lesson|
            sub = SubjectMatter.find( lesson.subject_matter_id )
            course = Course.find( sub.course_id )
            link_to course.name, admin_course_path(course.id)
        end
        column :subject_matter_id
        column "Translations" do |lesson|
            link_to "View Translations", admin_lesson_translations_path(q: { lesson_id_eq: lesson.id})
        end
        column :name
        column :is_approved
        actions
    end
    
    remove_filter :lesson_translation
    


end

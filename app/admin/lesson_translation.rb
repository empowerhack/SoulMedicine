ActiveAdmin.register LessonTranslation do

    menu false

    permit_params do
        permitted = [:lesson_id, :language_id, :translation]
        permitted << :is_approved if ['admin', 'superuser', 'courseuser'].include? current_admin_user.role
        permitted
    end
    
    index do
        selectable_column
        column "" do |lesson_translation|
            lesson = Lesson.find( lesson_translation.lesson_id )
            sub = SubjectMatter.find( lesson.subject_matter_id )
            course = Course.find( sub.course_id )
            %( 
                #{link_to course.name, admin_courses_path({ id_eq: course.id })}
                > #{link_to sub.name, admin_subject_matters_path({ id_eq: sub.id })}
                > #{link_to lesson.name, admin_lessons_path({ id_eq: lesson.id })} 
            ).html_safe
        end
        column :language_id
        column :translation
        column :is_approved
        actions
    end

#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end

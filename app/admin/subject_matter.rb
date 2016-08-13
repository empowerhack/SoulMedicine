ActiveAdmin.register SubjectMatter do

    menu false
    
    permit_params :name, :description, :order, :is_active, :course_id
    
    remove_filter :lesson
    
    sidebar "Course Material", only: [:show, :edit] do
        ul do
            li link_to "Courses", admin_courses_path(q: { id_eq: subject_matter.course_id})
            li link_to "Lessons", admin_lessons_path(q: { subject_matter_id_eq: subject_matter.id})
        end
    end
    
    index do
        selectable_column
        column :name
        column :description
        column :order
        column :is_active
        column :course_id
        column "" do |subject_matter|
            link_to "View Lessons", admin_lessons_path(q: { subject_matter_id_eq: subject_matter.id})
        end
        actions
    end


end

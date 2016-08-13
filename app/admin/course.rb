ActiveAdmin.register Course do

    menu

    permit_params :name, :description, :order, :is_active
    
    index do
        selectable_column
        column :name
        column :description
        column :order
        column :is_active
        column "" do |course|
            link_to "View Subjects", admin_subject_matters_path(q: { course_id_eq: course.id})
        end
        actions
    end


end

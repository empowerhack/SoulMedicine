ActiveAdmin.register SubjectMatter do

    menu false
    
    permit_params :name, :description, :order, :is_active, :course_id
    permit_params lesson_attributes: [:_destroy, :id, :name, :order, :is_approved]
    
    remove_filter :lesson
    
    controller do
        def scoped_collection
            super.includes :course, :lesson
        end
    end
    
    # sidebar "Course Material", only: [:show, :edit] do
    #     ul do
    #         li link_to "Courses", admin_courses_path(q: { id_eq: subject_matter.course_id})
    #         li link_to "Lessons", admin_lessons_path(q: { subject_matter_id_eq: subject_matter.id})
    #     end
    # end
    
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
    
    show do
        columns do
           column max_width: "35%" do
               panel subject_matter.name do
                    attributes_table_for subject_matter do
                        row :name
                        row :description
                        row :order
                        row :is_active
                        row :course_id
                    end
                end
           end
           column max_width: "35%" do
               panel "Lessons" do
                   table_for subject_matter.lesson do
                       column "Name" do |l|
                           li link_to l.name, admin_lesson_path(l)
                       end
                   end
               end
           end
        end
    end
    
    form do |f|
        f.semantic_errors *f.object.errors.keys
        tabs do
            tab "Subject Details" do
                f.inputs
            end
            if !f.object.new_record?
                tab "Lessons" do
                    f.has_many :lesson, heading: false, allow_destroy: true, new_record: true do |lt|
                        lt.input :name
                        lt.input :order
                        lt.input :is_approved
                    end
                end
            end
        end
        f.actions
    end


end

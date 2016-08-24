ActiveAdmin.register Course do

    menu

    permit_params :name, :description, :order, :is_active
    permit_params subject_matters_attributes: [:_destroy, :id, :name, :description, :order]
    
    remove_filter :lessons, :user, :user_courses
    
    controller do
        def scoped_collection
            super.includes :subject_matters, :lessons
        end
    end
    
    index do
        selectable_column
        column :name
        column :description
        column :order
        column :is_active
        column "Subjects" do |cc|
            if cc.subject_matters.exists?
                ul{
                    cc.subject_matters.order("`order` ASC").map do |sm|
                        li link_to sm.name, admin_subject_matter_path(sm)
                    end
                }
            end
          end
        actions
    end
    
    show do
        columns do
            column max_width: "35%" do
                panel course.name do
                    attributes_table_for course do
                        row :name
                        row :description
                        row :order
                        row :is_active
                    end
                end
            end
            column max_width: "65%" do
                panel "Subject Matters" do
                    table_for course.subject_matters do
                        column "Name" do |sm|
                            link_to sm.name, admin_subject_matter_path(sm)
                        end
                        column "Lessons" do |sm|
                            ul {
                                sm.lesson.each do |l|
                                    li link_to l.name, admin_lesson_path(l)
                                end
                            }
                        end
                    end
                end
            end
        end
    end
    
    form do |f|
        f.semantic_errors *f.object.errors.keys
        tabs do
            tab "Course Details" do
                f.inputs
            end
            if !f.object.new_record?
                tab "Subject Matters" do
                    f.has_many :subject_matters, heading: false, allow_destroy: true, new_record: true do |sm|
                        sm.input :name
                        sm.input :description
                        sm.input :order
                        sm.actions
                    end
                end
            end
        end
        f.actions
    end


end

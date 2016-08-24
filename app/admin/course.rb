ActiveAdmin.register Course do

    menu

    permit_params :name, :description, :order, :is_active
    permit_params subject_matters_attributes: [:_destroy, :id, :name, :description, :order]
    
    index do
        selectable_column
        column :name
        column :description
        # column do |course|
        #     if course.subject_matters.exists?
        #         table_for course.subject_matters.order("`order` ASC") do
        #           column do |sm|
        #             link_to sm.name, admin_subject_matter_path(sm)
        #           end
        #         end
        #     end
        #   end
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

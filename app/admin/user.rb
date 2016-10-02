ActiveAdmin.register User do

    permit_params :mobile_number, :country_id, :language_id ,course_ids:[]
    
    form do |f|
        f.semantic_errors *f.object.errors.keys
        tabs do
            tab "User Details" do
                f.inputs do
                    f.input :mobile_number
                    f.input :country
                    f.input :language
                end
            end
            if !f.object.new_record?
                tab "User Courses" do
                    f.input :courses, :as => :check_boxes
                end
                tab "User Preferences" do
                    f.inputs do
                        f.has_many :user_preference, new_record: false do |p|
                            p.inputs
                        end
                    end
                end
            end
        end
        

        
        
        f.actions
        
    end

end

ActiveAdmin.register User do

    permit_params :mobile_number, :country_id, :language_id ,course_ids:[]
    
    form do |f|
        f.semantic_errors *f.object.errors.keys
        f.inputs "User Details" do
            f.input :mobile_number
            f.input :country
            f.input :language
            if !f.object.new_record?
                f.input :courses, :as => :check_boxes
            end
        end

        # f.inputs "User Preferences", for: [:user_preference, f.object.user_preference || UserPreference.new] do |p|
        #     p.inputs
        # end
        
        f.actions
        
    end

end

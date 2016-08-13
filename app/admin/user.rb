ActiveAdmin.register User do

    permit_params :mobile_number,:name,:email, :country, :language
    
    form do |f|
        f.inputs "User Details" do
            f.input :name
            f.input :email
            f.input :mobile_number
            f.input :country
            f.input :language
        end
        f.inputs do
            f.has_many :user_preference, heading: "User Preferences", allow_destroy: true do |p|
                p.inputs
            end
        end
        f.actions
        
    end

end

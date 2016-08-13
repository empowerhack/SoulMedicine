ActiveAdmin.register Gender do

    menu parent: "Reference"
    
    permit_params :gender, :is_active


end

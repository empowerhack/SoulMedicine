ActiveAdmin.register Language do

    menu parent: "Reference"
    
    config.sort_order = 'is_active_asc'
    
    batch_action :toggle_active_status do |ids|
        Language.find(ids).each do |lang|
            lang.toggle! :is_active
        end
        redirect_to admin_languages_path, notice: "The languages have been updated."
    end
    
    
    index do
        selectable_column
        column :name
        column :locale
        column :is_active
        actions
    end
    
    filter :name
    filter :is_active

    permit_params :name, :is_active, :locale


end

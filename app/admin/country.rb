ActiveAdmin.register Country do

    menu parent: "Reference"
    
    config.sort_order = 'name_asc'
    
    batch_action :toggle_active_status do |ids|
        Country.find(ids).each do |country|
            country.toggle! :is_active
        end
        redirect_to admin_countries_path, notice: "The countries have been updated."
    end
    
    index do
        selectable_column
        column :name
        column :iso_code
        column :dial_code
        column :is_active
        actions
    end
    
    filter :name
    filter :iso_code
    filter :dial_code
    filter :is_active

    permit_params :name, :iso_code, :dial_code, :is_active


end

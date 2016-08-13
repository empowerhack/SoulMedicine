ActiveAdmin.register AdminUser do

  permit_params :email, :password, :password_confirmation, :role


  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :role
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at
  filter :role

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :role, :as => :select, :collection => {
        'Full Administrator'=>'admin', 
        'Super User'=>'superuser',
        'Course User'=>'courseuser',
        'Translator'=>'translator',
        'Simple User'=>'user',
        }
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end

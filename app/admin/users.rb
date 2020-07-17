ActiveAdmin.register User do
  actions :index, :show, :new, :create

  index do
    selectable_column
    id_column
    column :email
    column :full_name
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :full_name
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :full_name
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  permit_params :email, :name, :password, :password_confirmation, :full_name


end

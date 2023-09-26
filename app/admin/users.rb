ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :category
    column :authentication_token
    column :created_at
    column :sign_in_count
    actions
  end

  filter :email
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :name
      f.input :category
    end
    f.actions
  end
end

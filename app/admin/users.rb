ActiveAdmin.register User do
  index do
    selectable_column
    id_column
    column :email
    column :created_at
    column :updated_at
    column :name
    column :phone
    column :admin
    actions
  end
end

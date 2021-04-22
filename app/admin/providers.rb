ActiveAdmin.register Provider do

  permit_params :name, :address, :description, :delivery, :schedule, category_ids: []

  index do
    selectable_column
    id_column
    column :name
    column :address
    column :description
    column :delivery
    column :schedule
    column :categories
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :address
      row :description
      row :delivery
      row :schedule
      table_for provider.categories.order('name ASC') do
        column "Categories" do |category|
          link_to category.name, [ :admin, category ]
        end
      end
      table_for provider.services.order('name ASC') do
        column 'Services' do |service|
          link_to service.name, [:admin, service]
        end
      end
    end
  end

  form do |f|
    f.inputs "Add/Edit Provider" do
      f.input :name
      f.input :address
      f.input :description
      f.input :delivery
      f.input :schedule
      f.input :categories, as: :check_boxes
    end
    actions
  end
end

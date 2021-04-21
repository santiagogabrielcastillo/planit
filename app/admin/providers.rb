ActiveAdmin.register Provider do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :address, :description, :delivery, :schedule, category_ids: []
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :address, :description, :delivery, :schedule]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

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

ActiveAdmin.register Service do
  permit_params :name, :provider_id, :description, :cost, :photo

  form do |f|
    f.inputs 'Add/Edit Service' do
      f.input :name
      f.input :description
      f.input :cost
      f.input :photo, as: :file
      f.input :provider, as: :select
    end
    actions
  end
end

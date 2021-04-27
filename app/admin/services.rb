ActiveAdmin.register Service do
  permit_params :name, :provider_id, :description, :cost
end

class RemoveProvidersIdFromServices < ActiveRecord::Migration[6.0]
  def change
    remove_column :services, :providers_id
  end
end

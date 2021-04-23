class RemoveDeliveryFromProviders < ActiveRecord::Migration[6.0]
  def change
    remove_column :providers, :delivery
  end
end

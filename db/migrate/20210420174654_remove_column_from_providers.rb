class RemoveColumnFromProviders < ActiveRecord::Migration[6.0]
  def change
    remove_column :providers, :category
  end
end

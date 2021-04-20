class RemoveCategoryFromProvider < ActiveRecord::Migration[6.0]
  def change
    remove_column :providers, :category_id
  end
end

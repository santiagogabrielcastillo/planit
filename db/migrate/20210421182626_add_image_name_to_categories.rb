class AddImageNameToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :image_name, :string
  end
end

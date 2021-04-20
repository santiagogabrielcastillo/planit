class CreateCategoriesProviders < ActiveRecord::Migration[6.0]
  def change
    create_table :categories_providers, id: false do |t|
      t.belongs_to :category
      t.belongs_to :provider
    end
  end
end

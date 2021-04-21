class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :service, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :guests
      t.string :delivery
      t.string :address
      t.string :apartment
      t.date :date
      t.time :from
      t.time :to
      t.text :comments
      t.boolean :paid

      t.timestamps
    end
  end
end

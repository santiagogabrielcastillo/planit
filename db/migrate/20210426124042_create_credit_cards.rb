class CreateCreditCards < ActiveRecord::Migration[6.0]
  def change
    create_table :credit_cards do |t|
      t.string :number
      t.string :name
      t.string :expire
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

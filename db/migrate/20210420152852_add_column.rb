class AddColumn < ActiveRecord::Migration[6.0]
  def change
    add_reference :providers, :category, foreign_key: true
  end
end

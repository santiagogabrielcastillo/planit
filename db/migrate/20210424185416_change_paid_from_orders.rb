class ChangePaidFromOrders < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:orders, :paid, false)
  end
end

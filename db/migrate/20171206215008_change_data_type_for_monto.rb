class ChangeDataTypeForMonto < ActiveRecord::Migration[5.1]
  def change
    change_column :clients, :monto, :decimal, precision: 10, scale: 2
  end
end

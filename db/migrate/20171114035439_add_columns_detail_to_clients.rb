class AddColumnsDetailToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :telfijo, :string
    add_column :clients, :monto, :string
  end
end

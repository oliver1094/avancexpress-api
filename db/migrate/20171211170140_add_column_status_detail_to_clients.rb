class AddColumnStatusDetailToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :val_first, :boolean
    add_column :clients, :val_second, :boolean
    add_column :clients, :val_third, :boolean
  end
end

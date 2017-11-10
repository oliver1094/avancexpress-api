class AddDetailNameToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :last_name_two, :string
    add_column :clients, :name_two, :string
  end
end

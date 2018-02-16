class AddIsIfeToFileClients < ActiveRecord::Migration[5.1]
  def change
    add_column :file_clients, :isIfe, :boolean
  end
end

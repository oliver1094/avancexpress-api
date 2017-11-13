class AddStatusToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :status, :string
  end
end

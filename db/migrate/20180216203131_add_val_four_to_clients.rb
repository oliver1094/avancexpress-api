class AddValFourToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :val_four, :boolean
  end
end

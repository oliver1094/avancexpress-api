class RemoveDescriptionFromClients < ActiveRecord::Migration[5.1]
  def change
    remove_column :clients, :description, :string
  end
end

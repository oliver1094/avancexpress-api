class CreateFileContractClients < ActiveRecord::Migration[5.1]
  def change
    create_table :file_contract_clients do |t|
      t.string :name
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end

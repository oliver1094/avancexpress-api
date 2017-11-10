class CreateAddressClients < ActiveRecord::Migration[5.1]
  def change
    create_table :address_clients do |t|
      t.string :street_number
      t.string :cp
      t.string :state
      t.string :city
      t.string :municipio
      t.string :colonia
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end

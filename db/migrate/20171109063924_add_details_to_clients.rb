class AddDetailsToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :motive, :string
    add_column :clients, :phone, :string
    add_column :clients, :birth_date, :date
    add_column :clients, :rfc, :string
    add_column :clients, :curp, :string
    add_column :clients, :client_key, :string
    add_reference :clients, :user, foreign_key: true
  end
end

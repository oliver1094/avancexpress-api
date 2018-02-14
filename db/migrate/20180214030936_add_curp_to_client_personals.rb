class AddCurpToClientPersonals < ActiveRecord::Migration[5.1]
  def change
    add_column :client_personals, :curp, :string
  end
end

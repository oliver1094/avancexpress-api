class CreateClientLaborals < ActiveRecord::Migration[5.1]
  def change
    create_table :client_laborals do |t|
      t.references :client, foreign_key: true
      t.string :company_name
      t.string :puesto
      t.string :salario_r
      t.decimal :gasto_mensual
      t.string :contract_type
      t.decimal :salario_mensual
      t.date :fecha_init

      t.timestamps
    end
  end
end

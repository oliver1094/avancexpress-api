class CreateClientLoanDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :client_loan_details do |t|
      t.date :payment_date
      t.decimal :before_nomina, precision: 10, scale: 2
      t.decimal :comision, precision: 10, scale: 2
      t.decimal :interes, precision: 10, scale: 2
      t.decimal :iva, precision: 10, scale: 2
      t.decimal :payment_total, precision: 10, scale: 2
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end

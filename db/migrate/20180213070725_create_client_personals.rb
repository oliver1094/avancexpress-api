class CreateClientPersonals < ActiveRecord::Migration[5.1]
  def change
    create_table :client_personals do |t|
      t.references :client, foreign_key: true
      t.string :sex
      t.string :phone
      t.string :cp
      t.string :city
      t.string :civil_state
      t.string :home_type
      t.string :plan_type
      t.string :birth_date
      t.string :rfc
      t.string :home_num
      t.string :state
      t.string :colonia
      t.string :dependent
      t.string :company_phone
      t.boolean :is_credit_card
      t.boolean :is_credit_hip
      t.boolean :is_credit_auto
      t.boolean :is_buro

      t.timestamps
    end
  end
end

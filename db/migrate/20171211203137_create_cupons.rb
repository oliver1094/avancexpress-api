class CreateCupons < ActiveRecord::Migration[5.1]
  def change
    create_table :cupons do |t|
      t.string :decription
      t.decimal :porcentage_desc, precision: 10, scale: 2
      t.date :date_v

      t.timestamps
    end
  end
end

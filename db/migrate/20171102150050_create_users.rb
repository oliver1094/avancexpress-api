class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :password_salt
      t.string :image_profile
      t.references :type_user, foreign_key: true

      t.timestamps
    end
  end
end

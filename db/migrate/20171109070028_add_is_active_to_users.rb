class AddIsActiveToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :is_active, :bool
  end
end

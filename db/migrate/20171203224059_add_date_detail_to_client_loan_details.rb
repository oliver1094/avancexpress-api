class AddDateDetailToClientLoanDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :client_loan_details, :request_date, :date
  end
end

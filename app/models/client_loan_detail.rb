class ClientLoanDetail < ApplicationRecord
  belongs_to :client
  validates :payment_date, presence: true
  validates :payment_total, presence: true
  validates :before_nomina, presence: true
  validates :comision, presence: true
  validates :iva, presence: true
  validates :interes, presence: true

end

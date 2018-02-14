class Client < ApplicationRecord
  belongs_to :user
  has_one :address_client
  has_one :client_loan_detail
  has_one :client_personal
  has_one :client_laboral
  has_many :file_clients
  has_many :file_contract_clients
  validates :name, presence: true
  validates :last_name, presence: true
  validates :motive, presence: true
  validates :phone, presence: true
end

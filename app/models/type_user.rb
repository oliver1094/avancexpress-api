class TypeUser < ApplicationRecord
  has_one :user
  ADMIN = 1
  CLIENT = 2

  TYPE_USERS_PERMIT = [ADMIN, CLIENT]
end

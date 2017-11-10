class TypeUser < ApplicationRecord
  has_one :user
  ADMIN = 1
  CLIENT = 2
  VALIDATOR = 3

  TYPE_USERS_PERMIT = [ ADMIN, CLIENT, VALIDATOR ]
end

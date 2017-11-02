class User < ApplicationRecord
  belongs_to :type_user
  has_one :admin, dependent: :destroy
  has_one :client, dependent: :destroy

  validates :username, presence: true
  validates :username, uniqueness: {case_sensitive: false}

  before_create :password_hash
  before_update :password_hash, if: :change_password

  validates :password, presence: true, :on => :create
  validates_confirmation_of :password, :on => :create
  validates_presence_of :password_confirmation, :if => :password_changed?, :on => :create
  attr_accessor :change_password

  validates :password, presence: true, :on => :update, if: :change_password
  validates_confirmation_of :password, :on => :update, if: :change_password

  def clearance_levels
    self.type_user.name
  end

  def password_hash
    self.password_salt = BCrypt::Engine.generate_salt
    self.password = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(username, password)
    user = find_by_username(username)
    if user && user.password == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end

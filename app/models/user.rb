class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews

  validates :password, presence: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true
end

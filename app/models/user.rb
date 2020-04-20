class User < ApplicationRecord
  validates_uniqueness_of :email
  validates_presence_of :password_digest
  validates :api_token, uniqueness: true

  has_secure_password
  has_secure_token :api_token
end

class User < ApplicationRecord
  validates_uniqueness_of :email
  validates_presence_of :password_digest
  validates_uniqueness_of :api_key

  has_secure_password
  has_secure_token :api_key
end

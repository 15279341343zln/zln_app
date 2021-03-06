class User < ApplicationRecord
  before_save { email.downcase! }#回调
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },#小写
                    uniqueness: { case_sensitive: false } #唯一性
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end

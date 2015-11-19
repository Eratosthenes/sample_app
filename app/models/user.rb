class User < ActiveRecord::Base
  before_save {self.email = email.downcase}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 255}
  validates :email, format: {with: VALID_EMAIL_REGEX}
  validates :email, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, length: {minimum: 6}
end

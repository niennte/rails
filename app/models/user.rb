class User < ApplicationRecord

  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_validation {
    self.email = email.downcase
    self.email = email.gsub(/\s+/, '')
  }

  validates :name, presence: true
  validates :email, \
    format: { with: EMAIL_FORMAT,
            message: 'Email address needs to be valid' }, \
    uniqueness: true

  # assumes the db column is called password_digest
  has_secure_password

  has_many :posts
end

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

  # paperclip gem methods
  has_attached_file :avatar, \
  styles: { medium: '150x150>', thumb: '50x50>', micro: '25x25' }, \
  default_url: '/images/:style/default_user.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

end

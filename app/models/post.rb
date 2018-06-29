class Post < ApplicationRecord

  validates :title, presence: true
  validates :body, presence: true

  # paperclip gem methods
  has_attached_file :photo, \
  styles: { large: '500x500>', medium: '300x300>', thumb: '100x100>' }, \
  default_url: '/images/:style/missing.png'
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  belongs_to :user
end

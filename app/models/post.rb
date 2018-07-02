class Post < ApplicationRecord

  validates :title, presence: true
  validates :body, presence: true

  # paperclip gem methods
  has_attached_file :photo, \
  styles: { large: '500x500>', medium: '300x300>', thumb: '100x100>' }, \
  default_url: '/images/:style/missing.png'
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  belongs_to :user

  # geocoder gem methods
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  # the latter rails generated helper method:
  # every DB field has a method like this
  # geocode method looks up coordinates for the address
end

class Photo < ApplicationRecord
  belongs_to :album, optional: true, :counter_cache => true
  attr_accessor :image
  mount_uploader :image, ImageUploader
end

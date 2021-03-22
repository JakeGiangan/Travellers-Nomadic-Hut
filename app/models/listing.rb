class Listing < ApplicationRecord
  has_many :images
  validate :image_type

  def image_type
    images.each do |image|
      if !image.content_type.in?(%('image/jpeg image/png'))
        errors.add(:images, 'needs to be a JPEG or PNG')
      end
    end
  end
end

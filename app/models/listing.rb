class Listing < ApplicationRecord
  has_many :images
  has_many :bookings, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end

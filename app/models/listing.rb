class Listing < ApplicationRecord
  has_many :images
  has_many :bookings, dependent: :destroy
  has_many :reviews
end

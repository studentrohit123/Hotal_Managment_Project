class Room < ApplicationRecord
  has_one_attached :image
  belongs_to :hotel
  has_many :bookings ,dependent: :destroy
end

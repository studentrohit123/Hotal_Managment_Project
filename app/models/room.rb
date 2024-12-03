class Room < ApplicationRecord
  has_one_attached :image
  belongs_to :hotel
  has_many :bookings ,dependent: :destroy

  validates :number, presence: true, numericality: { only_integer: true }
  validates :ac_type, presence: true, inclusion: { in: ['AC', 'Non-AC'] }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }

end

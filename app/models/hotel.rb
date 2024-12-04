class Hotel < ApplicationRecord
  has_one_attached :image
  has_many :rooms , dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :address, presence: true, length: { maximum: 255 }
  validates :number, presence: true, format: { with: /\A\d{10}\z/, message: "must be a 10-digit number" }
  validates :description, presence: true, length: { maximum: 250 }
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  def hotel_names
    "#{name}"
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[rooms]
  end
end

class Hotel < ApplicationRecord
  has_one_attached :image
  has_many :rooms , dependent: :destroy

  def hotel_names
    "#{name}"
  end
end

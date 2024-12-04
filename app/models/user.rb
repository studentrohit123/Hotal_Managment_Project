class User < ApplicationRecord
  has_many :bookings, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :number, presence: true, format: { with: /\A\d{10}\z/, message: "must be a 10-digit number" }
  validates :address, presence: true, length: { maximum: 255 }
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

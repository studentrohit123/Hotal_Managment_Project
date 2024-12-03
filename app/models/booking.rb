class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room

  enum gender: { male: "Male", female: "Female" }

  validates :name, presence: true, length: { minimum: 3, maximum: 50}
  validates :contact, presence: true, format: { with: /\A\d{10}\z/, message: "must be a 10-digit number" }
  validates :age, presence: true, numericality: { only_integer: true }, inclusion: { in: 18..70 }
  validates :date, presence: { message: "Booking ka date dena zaroori hai" }

  validate :date_must_be_in_future

  after_create :send_confirmation_email

  private

  def date_must_be_in_future
    if date.present? && date <= Date.today
      errors.add(:date)
    end
  end

  def send_confirmation_email
    BookingMailer.booking_confirmation(self).deliver_later
  end
end

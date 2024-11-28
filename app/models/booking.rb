class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room

  enum gender: { male: "Male", female: "Female" }

  after_create :send_confirmation_email

  private

  def send_confirmation_email
    BookingMailer.booking_confirmation(self).deliver_later
  end
end

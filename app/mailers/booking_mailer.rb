class BookingMailer < ApplicationMailer
  default from: 'no-reply@yourhotel.com'

  def booking_confirmation(booking)
    @booking = booking
    @user = @booking.user 

    mail(to: @user.email, subject: 'Your Booking Confirmation')
  end
end

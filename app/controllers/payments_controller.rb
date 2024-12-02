class PaymentsController < ApplicationController
  def checkout
    @booking = Booking.find(params[:id])
    room = @booking.room
  
    price = Stripe::Price.create(
      unit_amount: (room.price * 100).to_i, 
      currency: 'inr',
      product_data: {
        name: room.ac_type
      }
    )
  
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        price: price.id,
        quantity: 1
      }],
      mode: 'payment',
      success_url: booking_url(@booking, status: 'success'),
      cancel_url: booking_url(@booking, status: 'cancel')
    )
  
    @booking.update(stripe_payment_id: session.id, payment_status: 'pending')
  
    redirect_to session.url, allow_other_host: true
  end
  
end

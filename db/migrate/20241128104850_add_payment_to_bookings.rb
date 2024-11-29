class AddPaymentToBookings < ActiveRecord::Migration[7.2]
  def change
    add_column :bookings, :stripe_payment_id, :string
    add_column :bookings, :payment_status, :string
  end
end

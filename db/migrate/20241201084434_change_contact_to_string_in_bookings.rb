class ChangeContactToStringInBookings < ActiveRecord::Migration[7.2]
  def change
    change_column :bookings, :contact, :string
  end
end

class AddHotelData < ActiveRecord::Migration[7.2]
  def change
    Hotel.create([
    {
    name: "Ocean View",
    address: "456/2, vijay nagar indore, near opollo tawer",
    number: "9131433212",
    description: "A beautiful ocean-facing hotel.",
    rating: 4
    }
    ]) 
    end
end

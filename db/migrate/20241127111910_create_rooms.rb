class CreateRooms < ActiveRecord::Migration[7.2]
  def change
    create_table :rooms do |t|
      t.string :room_number
      t.string :room_type
      t.decimal :price
      t.integer :capacity
      t.references :hotel, null: false, foreign_key: true

      t.timestamps
    end
  end
end

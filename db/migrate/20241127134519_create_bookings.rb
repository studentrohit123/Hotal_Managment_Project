class CreateBookings < ActiveRecord::Migration[7.2]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.date :date
      t.string :name
      t.integer :age
      t.string :gender
      t.integer :contact

      t.timestamps
    end
  end
end

class CreateHotels < ActiveRecord::Migration[7.2]
  def change
    create_table :hotels do |t|
      t.string :name
      t.text :address
      t.string :contact_number
      t.text :description
      t.decimal :rating

      t.timestamps
    end
  end
end

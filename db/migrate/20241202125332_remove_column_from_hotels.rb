class RemoveColumnFromHotels < ActiveRecord::Migration[7.2]
  def change
    rename_column :hotels, :contact_number, :number
  end
end

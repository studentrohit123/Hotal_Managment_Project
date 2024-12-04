class RemoveColumnFromRoom < ActiveRecord::Migration[7.2]
  def change
    rename_column :rooms, :room_number, :number
    rename_column :rooms, :room_type, :type
  end
end

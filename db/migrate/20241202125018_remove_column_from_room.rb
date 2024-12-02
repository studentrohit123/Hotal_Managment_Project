class RemoveColumnFromRoom < ActiveRecord::Migration[7.2]
  def change
    rename_column :rooms, :room_number, :number
    rename_column :rooms, :room_type, :type
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end

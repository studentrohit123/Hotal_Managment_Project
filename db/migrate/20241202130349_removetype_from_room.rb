class RemovetypeFromRoom < ActiveRecord::Migration[7.2]
  def change
    rename_column :rooms, :type, :ac_type
  end
end

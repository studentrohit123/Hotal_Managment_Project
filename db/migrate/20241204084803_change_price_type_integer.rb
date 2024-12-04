class ChangePriceTypeInteger < ActiveRecord::Migration[7.2]
  def change
    change_column :rooms, :price, :integer
  end
end

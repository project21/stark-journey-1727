class RemovePriceFromDeals < ActiveRecord::Migration
  def up
    remove_column :deals, :price
  end

  def down
    add_column :deals, :price, :decimal
  end
end

class RemoveQuantityFromDeals < ActiveRecord::Migration
  def up
    remove_column :deals, :quantity
  end

  def down
    add_column :deals, :quantity, :integer
  end
end

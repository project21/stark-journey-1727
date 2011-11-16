class RemoveItemFreeFromDeals < ActiveRecord::Migration
  def up
    remove_column :deals, :item_free
  end

  def down
    add_column :deals, :item_free, :boolean
  end
end

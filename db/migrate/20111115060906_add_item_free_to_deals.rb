class AddItemFreeToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :item_free, :boolean
  end
end

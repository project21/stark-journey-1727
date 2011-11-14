class AddAvailableItemsToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :available_items, :integer
  end
end

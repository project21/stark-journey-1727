class AddNItemFreeToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :n_item_free, :integer
  end
end

class AddPriceToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :price, :decimal ,:precision=>5,:scale=>2
  end
end

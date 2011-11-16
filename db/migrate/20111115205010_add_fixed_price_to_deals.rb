class AddFixedPriceToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :fixed_price, :boolean
  end
end

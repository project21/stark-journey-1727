class AddRegPriceToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :reg_price, :decimal
  end
end

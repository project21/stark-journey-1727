class AddBuyOneToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :buy_one, :boolean
  end
end

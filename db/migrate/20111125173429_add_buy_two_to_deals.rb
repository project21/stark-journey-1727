class AddBuyTwoToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :buy_two, :boolean
  end
end

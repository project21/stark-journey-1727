class AddUntilSoldToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :until_sold, :boolean
  end
end

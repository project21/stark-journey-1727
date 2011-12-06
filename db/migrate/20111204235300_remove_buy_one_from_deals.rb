class RemoveBuyOneFromDeals < ActiveRecord::Migration
  def up
    remove_column :deals, :buy_one
  end

  def down
    add_column :deals, :buy_one, :boolean
  end
end

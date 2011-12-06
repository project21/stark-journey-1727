class RemoveBuyTwoFromDeals < ActiveRecord::Migration
  def up
    remove_column :deals, :buy_two
  end

  def down
    add_column :deals, :buy_two, :boolean
  end
end

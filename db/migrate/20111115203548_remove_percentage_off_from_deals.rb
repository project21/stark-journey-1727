class RemovePercentageOffFromDeals < ActiveRecord::Migration
  def up
    remove_column :deals, :percentage_off
  end

  def down
    add_column :deals, :percentage_off, :boolean
  end
end

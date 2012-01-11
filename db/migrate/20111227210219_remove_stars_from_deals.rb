class RemoveStarsFromDeals < ActiveRecord::Migration
  def up
    remove_column :deals, :stars
  end

  def down
    add_column :deals, :stars, :integer
  end
end

class RemoveHowMuchFromDeals < ActiveRecord::Migration
  def up
    remove_column :deals, :how_much
  end

  def down
    add_column :deals, :how_much, :boolean
  end
end

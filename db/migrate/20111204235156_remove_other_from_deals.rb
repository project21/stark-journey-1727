class RemoveOtherFromDeals < ActiveRecord::Migration
  def up
    remove_column :deals, :other
  end

  def down
    add_column :deals, :other, :boolean
  end
end

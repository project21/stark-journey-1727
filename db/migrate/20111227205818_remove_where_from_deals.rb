class RemoveWhereFromDeals < ActiveRecord::Migration
  def up
    remove_column :deals, :where
  end

  def down
    add_column :deals, :where, :boolean
  end
end

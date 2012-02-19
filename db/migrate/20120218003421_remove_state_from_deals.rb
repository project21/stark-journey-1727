class RemoveStateFromDeals < ActiveRecord::Migration
  def up
    remove_column :deals, :state
  end

  def down
    add_column :deals, :state, :string
  end
end

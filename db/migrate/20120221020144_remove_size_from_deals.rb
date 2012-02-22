class RemoveSizeFromDeals < ActiveRecord::Migration
  def up
    remove_column :deals, :size
  end

  def down
    add_column :deals, :size, :string
  end
end

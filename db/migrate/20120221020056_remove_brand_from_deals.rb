class RemoveBrandFromDeals < ActiveRecord::Migration
  def up
    remove_column :deals, :brand
  end

  def down
    add_column :deals, :brand, :string
  end
end

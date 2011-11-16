class AddQuantityToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :quantity, :integer
  end
end

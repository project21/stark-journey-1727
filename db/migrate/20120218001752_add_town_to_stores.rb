class AddTownToStores < ActiveRecord::Migration
  def change
    add_column :stores, :town, :string
  end
end

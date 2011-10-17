class AddCityIdToStores < ActiveRecord::Migration
  def change
    add_column :stores, :city_id, :integer
  end
end

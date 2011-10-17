class AddStoreNameToStoreDeals < ActiveRecord::Migration
  def change
    add_column :store_deals, :store_name, :string
  end
end

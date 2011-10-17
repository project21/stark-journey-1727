class AddAddressToStoreDeals < ActiveRecord::Migration
  def change
    add_column :store_deals, :address, :string
  end
end

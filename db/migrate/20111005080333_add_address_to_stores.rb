class AddAddressToStores < ActiveRecord::Migration
  def change
    add_column :stores, :address, :string
  end
end

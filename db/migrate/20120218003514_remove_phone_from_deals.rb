class RemovePhoneFromDeals < ActiveRecord::Migration
  def up
    remove_column :deals, :phone
  end

  def down
    add_column :deals, :phone, :string
  end
end

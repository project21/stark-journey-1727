class AddCustomDetailsToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :custom_details, :string
  end
end

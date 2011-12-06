class AddOtherDetailsToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :other_details, :boolean,:default=>false
  end
end

class AddOfficialToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :official, :boolean ,:default=>false
  end
end

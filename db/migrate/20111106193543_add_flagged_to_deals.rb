class AddFlaggedToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :flagged, :boolean,:default=>false
  end
end

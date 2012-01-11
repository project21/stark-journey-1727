class AddWhereToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :where, :boolean,:default=>false
  end
end

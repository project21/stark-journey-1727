class AddHowMuchToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :how_much, :boolean, :default=>false
  end
end

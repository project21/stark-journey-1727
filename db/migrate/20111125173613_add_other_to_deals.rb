class AddOtherToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :other, :boolean
  end
end

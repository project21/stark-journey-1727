class AddTownToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :town, :string
  end
end

class AddPercentageOffToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :percentage_off, :boolean
  end
end

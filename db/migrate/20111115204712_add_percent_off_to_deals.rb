class AddPercentOffToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :percent_off, :integer
  end
end

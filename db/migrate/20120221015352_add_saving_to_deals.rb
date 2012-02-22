class AddSavingToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :saving, :decimal
  end
end

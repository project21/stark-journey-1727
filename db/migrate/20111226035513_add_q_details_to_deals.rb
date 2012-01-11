class AddQDetailsToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :q_details, :text
  end
end

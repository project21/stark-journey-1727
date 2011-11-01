class AddDetailsToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :details, :text
  end
end

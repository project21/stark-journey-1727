class RemoveQDetailsFromDeals < ActiveRecord::Migration
  def up
    remove_column :deals, :q_details
  end

  def down
    add_column :deals, :q_details, :text
  end
end

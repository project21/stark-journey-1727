class AddDealIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :deal_id, :integer
  end
end

class CreateStoreDeals < ActiveRecord::Migration
  def change
    create_table :store_deals do |t|
      t.integer :store_id
      t.integer :deal_id

      t.timestamps
    end
  end
end

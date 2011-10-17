class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :size
      t.string :item_name
      t.string :brand
      t.decimal :price
      t.integer :stars

      t.timestamps
    end
  end
end

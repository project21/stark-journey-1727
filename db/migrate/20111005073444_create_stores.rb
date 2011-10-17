class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :store_name

      t.timestamps
    end
  end
end

class AddZipcodeToStores < ActiveRecord::Migration
  def change
    add_column :stores, :zipcode, :string
  end
end

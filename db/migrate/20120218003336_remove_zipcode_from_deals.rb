class RemoveZipcodeFromDeals < ActiveRecord::Migration
  def up
    remove_column :deals, :zipcode
  end

  def down
    add_column :deals, :zipcode, :string
  end
end

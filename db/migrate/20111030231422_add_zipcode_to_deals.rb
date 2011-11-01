class AddZipcodeToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :zipcode, :string
  end
end

class AddCityToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :city, :string
  end
end

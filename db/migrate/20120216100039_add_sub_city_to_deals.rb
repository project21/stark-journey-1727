class AddSubCityToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :sub_city, :string
  end
end

class Addnewcategory < ActiveRecord::Migration
  def up
  	Category.create(:category_name=>"Grocery")
  	Category.create(:category_name=>"Electronics")
  	Category.create(:category_name=>"Clothing & shoes")
  	Category.create(:category_name=>"Houseware & Furniture")
  	Category.create(:category_name=>"Jewelry")
  	Category.create(:category_name=>"Kids")
  	Category.create(:category_name=>"Restaurant & FastFood")
  	Category.create(:category_name=>"Home Improvement")
  	Category.create(:category_name=>"Health &Beauty")
  	Category.create(:category_name=>"Activities &Events")

  end

  def down
  end
end

class Categories < ActiveRecord::Migration
  def up
  	Category.create(:category_name=>"Clothing")
  	Category.create(:category_name=>"Restaurant")
  	Category.create(:category_name=>"Entertainment")
  	Category.create(:category_name=>"Activities &Events")
  end

  def down
  end
end

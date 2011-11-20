class Removecategory < ActiveRecord::Migration
  def up
  	Category.delete_all
  end

  def down
  end
end

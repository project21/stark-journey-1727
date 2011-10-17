class Cities < ActiveRecord::Migration
  def up
  	City.create(:name =>"Sanfrancisco")
  	City.create(:name =>"Sacramento")
  end

  def down
  end
end

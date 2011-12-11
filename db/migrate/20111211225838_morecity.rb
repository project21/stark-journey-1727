class Morecity < ActiveRecord::Migration
  def up
  	City.create(:name =>"San Francisco")
  	City.create(:name =>"Sacramento")
  	City.create(:name =>"Los Angeles")
  end

  def down
  end
end

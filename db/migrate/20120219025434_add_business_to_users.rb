class AddBusinessToUsers < ActiveRecord::Migration
  def change
    add_column :users, :business, :boolean,:default=>false
  end
end

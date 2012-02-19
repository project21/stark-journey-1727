class RemoveUrlFromStores < ActiveRecord::Migration
  def up
    remove_column :stores, :url
  end

  def down
    add_column :stores, :url, :string
  end
end

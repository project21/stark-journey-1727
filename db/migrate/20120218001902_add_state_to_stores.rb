class AddStateToStores < ActiveRecord::Migration
  def change
    add_column :stores, :state, :string
  end
end

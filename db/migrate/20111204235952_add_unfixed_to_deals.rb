class AddUnfixedToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :unfixed, :string
  end
end

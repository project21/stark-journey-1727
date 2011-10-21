class AddSubmitterIdToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :submitter_id, :integer
  end
end

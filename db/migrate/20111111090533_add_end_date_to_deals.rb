class AddEndDateToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :end_date, :date
  end
end

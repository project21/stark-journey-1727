class AddPhoneToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :phone, :string
  end
end

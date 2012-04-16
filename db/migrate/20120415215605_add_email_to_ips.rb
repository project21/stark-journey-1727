class AddEmailToIps < ActiveRecord::Migration
  def change
    add_column :ips, :email, :string
  end
end

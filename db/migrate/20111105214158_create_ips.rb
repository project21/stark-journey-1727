class CreateIps < ActiveRecord::Migration
  def change
    create_table :ips do |t|
      t.string :ip_address
      t.integer :ip_count,:default=>0

      t.timestamps
    end
  end
end

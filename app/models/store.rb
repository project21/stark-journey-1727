class Store < ActiveRecord::Base
	belongs_to :city
	has_many :deals ,:through =>:store_deals
	has_many :store_deals
    validates_presence_of :store_name,:message=>"is required"
    validates_presence_of :address, :message=>"is required,should be cross street,actual numbbers is not required,e.g Sunrise blvd"
end

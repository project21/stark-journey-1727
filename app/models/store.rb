class Store < ActiveRecord::Base
	belongs_to :city
	has_many :deals ,:through =>:store_deals
	has_many :store_deals
    validates_presence_of :store_name,:message=>"Please enter store name"
    validates_presence_of :address, :message=>"Please enter cross street,e.g Sunrise blvd"
end

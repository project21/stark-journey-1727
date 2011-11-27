class Store < ActiveRecord::Base
	belongs_to :city
	has_many :deals ,:through =>:store_deals
	has_many :store_deals
    validates_presence_of :store_name,:message=>"is required"
    
end

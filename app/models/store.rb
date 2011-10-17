class Store < ActiveRecord::Base
	belongs_to :city
	has_many :deals ,:through =>:store_deals
	has_many :store_deals


end

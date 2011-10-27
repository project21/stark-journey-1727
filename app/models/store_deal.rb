class StoreDeal < ActiveRecord::Base
	belongs_to :store
	belongs_to :deal
	
	
end

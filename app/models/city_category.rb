class CityCategory < ActiveRecord::Base
	belongs_to :category
	belongs_to :city
end

class Category < ActiveRecord::Base
	has_many :deals
	has_many :cities ,:through =>:city_categories
	has_many :city_categories
	
end

class Category < ActiveRecord::Base
	has_many :deals
	has_many :cities ,:through =>:city_categories
	has_many :city_categories
	validates_presence_of :category_name,:message=>"Please choose category name"
end

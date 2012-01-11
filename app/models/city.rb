class City < ActiveRecord::Base
	has_many :stores
	has_many :deals 
	has_many :users 
	has_many :categories ,:through =>:city_categories
	has_many :city_categories
	has_many :questions
end

class Deal < ActiveRecord::Base
	belongs_to :city
	belongs_to :category
	has_many :users ,:through => :user_deal
	has_many :user_deals
	has_many :stores ,:through =>:store_deals
	has_many :store_deals
	has_many :comments
	accepts_nested_attributes_for :stores 
	acts_as_voteable 
	mount_uploader :image, ImageUploader 
	validates_presence_of :item_name,:message=>"Please enter product name"
    validates_presence_of :price ,:message=>"Please enter price of the item "
    validates_length_of   :size ,:maximum=>3,:message=>"Should be number number of items or item size in lb,oz etc."
end

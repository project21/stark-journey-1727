class Deal < ActiveRecord::Base
	belongs_to :city
	belongs_to :category
	belongs_to :user
	has_many :stores ,:through =>:store_deals
	has_many :store_deals
	has_many :comments
	accepts_nested_attributes_for :stores 
	acts_as_voteable 
	mount_uploader :image, ImageUploader 
	validates_presence_of :item_name,:message=>"Please enter product name"
    validates_presence_of :price ,:message=>"Please enter price of the item "
    validates_length_of   :size ,:maximum=>5,:message=>"Should be number number of items or item size in lb,oz etc."
  #  validates_presence_of :town ,:message=>"Please enter the city"
   # validates_length_of :state ,:is=>2,:message=>"Enter only 2 characters"
   # validates_length_of :zipcode, :is=>5, :message=>"Invalid zipcode"
    

end

class Deal < ActiveRecord::Base
	belongs_to :city
	belongs_to :category
	belongs_to :user
	has_many :stores ,:through =>:store_deals
	has_many :store_deals
	has_many :comments ,:dependent=>:destroy									
	accepts_nested_attributes_for :stores 
	acts_as_voteable 
	mount_uploader :image, ImageUploader 
	validates_presence_of :item_name,:message=>"is required"
    validates_numericality_of :price 
    validates_numericality_of :reg_price ,:allow_nil=>true
    validates_length_of   :size ,:maximum=>9,:message=>"Should be number number of items or item size in lb,oz etc."
    validates_format_of :phone,:with=>/\d\d\d\s\d\d\d\s\d\d\d\d/,:allow_nil=>true,:message=>"should be XXX XXX XXXX	"
    validates_length_of :state ,:is=>2,:allow_nil=>true,:message=>"Enter only 2 characters"
   validates_format_of :zipcode, :with=>/\d\d\d\d\d/ ,:allow_nil=>true
    
    
end

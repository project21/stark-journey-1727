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
	validates_presence_of :category_id
	validates_presence_of :sub_city,:allow_nil=>true
	validates_length_of :town ,:maximum=>30,:allow_nil=>true
	#validates_presence_of :quantity, :unless => Proc.new { |m| m.percent_off.blank?  },:message=>"is required when you choose pricing other than actual deal price"
	#validates_presence_of :quantity, :unless => Proc.new { |m| m.n_item_free.blank?  },:message=>"is required when you choose pricing other than actual deal price"
	validates_presence_of :details #, :unless => Proc.new { |m| m.other_details.blank?  }
	validates_presence_of :fixed_price , :if => "unfixed.blank? and other_details.blank? and percent_off.blank? "
	validates_presence_of :unfixed , :if => "fixed_price.blank? and other_details.blank? and percent_off.blank? "
	validates_presence_of :item_name,:message=>"is required"
    validates_numericality_of :price , :if => "unfixed.blank? and other_details.blank? and percent_off.blank?"
    validates_numericality_of :reg_price ,:if=>"saving.blank?"
    validates_numericality_of :saving ,:if=>"reg_price.blank?"
    validates_numericality_of :percent_off ,:allow_nil=>true
    validates_numericality_of :n_item_free ,:allow_nil=>true
    validates_inclusion_of :until_sold,:in=>[true,false] , :if=>"end_date.blank?" 
    validates_length_of :custom_details ,:within => 10..30,:unless => Proc.new { |m| m.other_details.blank?  }
   # validates_presence_of :end_date ,:if=>"until_sold.blank?"
    
end

class Question < ActiveRecord::Base
	belongs_to :city
	belongs_to :category
	belongs_to :user
	has_many :answers ,:dependent => :destroy
	validates_presence_of :item
	validates_presence_of :category_id
	validates_presence_of :how_much, :if=>"where.blank?"
	validates_presence_of :where, :if=>"how_much.blank?"
end

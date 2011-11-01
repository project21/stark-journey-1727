class Comment < ActiveRecord::Base
	belongs_to :deal
	belongs_to :user
	validates_presence_of :body ,:message=>"Please write the comment before submitting"
end

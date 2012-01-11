class Answer < ActiveRecord::Base
	belongs_to :question
	belongs_to :user
	acts_as_voteable 
	validates_presence_of :location
	validates_presence_of :pricing	
end

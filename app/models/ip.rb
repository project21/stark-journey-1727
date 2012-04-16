class Ip < ActiveRecord::Base
	attr_accessible :ip_address,:email
	validates_format_of :email ,:with=>/^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i ,:message=>"is invalid"
end

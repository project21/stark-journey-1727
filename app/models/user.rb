class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable and :activatable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation,:username

  has_one  :city
  has_many :deals 
  has_many :comments
  acts_as_voter
  has_karma(:deals, :as => :submitter, :weight => 0.5)

end

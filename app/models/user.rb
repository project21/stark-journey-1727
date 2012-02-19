class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable and :activatable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation,:username,:business
  has_many :questions
  has_one  :city
  has_many :deals 
  has_many :answers
  has_many :comments
  has_one  :store
  acts_as_voter
  has_karma(:deals, :as => :submitter, :weight => 0.5)

end

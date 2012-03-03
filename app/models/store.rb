class Store < ActiveRecord::Base
	belongs_to :city
	has_many :deals ,:through =>:store_deals
	has_many :store_deals
	belongs_to :user
    validates_presence_of :store_name ,:unless => Proc.new { |m| m.address.blank?  }
    validates_presence_of :address, :unless => Proc.new { |m| m.store_name.blank?  }
    validates_presence_of :address, :unless => Proc.new { |m| m.state.blank?  }
    validates_presence_of :town, :unless => Proc.new { |m| m.address.blank?  }
    validates_format_of :phone,:with=>/\d\d\d\s\d\d\d\s\d\d\d\d/,:allow_nil=>true#,:allow_blank=>true,:message=>"should be XXX XXX XXXX	"
    validates_length_of :state ,:is=>2,:allow_nil=>true,:message=>"Enter only 2 characters"
    validates_format_of :zipcode, :with=>/\d\d\d\d\d/ ,:allow_nil=>true
    validates_format_of :website,:with=> /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix ,:allow_blank=>true
    
     attr_accessible :address, :latitude, :longitude,:town,:store_name,:state,:zipcode,:phone,:website,:user_id
    geocoded_by :full_address
    after_validation :geocode #, :if => :address_changed?

    def full_address
   [address, town, state, zipcode].compact.join(', ')
   end
   
end

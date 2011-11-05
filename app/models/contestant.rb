class Contestant < ActiveRecord::Base
  has_many :contestant_entries
  
  #attr_accessible
  attr_accessor :agreed_to_rules
  attr_accessor :email_confirmation
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, :presence => true,
                    :format   => { :with => email_regex }, 
                    :uniqueness => { :case_sensitive => false }, 
                    :confirmation => true
                    
        # N.B :confirmation creates a virtual attribute email_confirmation

end
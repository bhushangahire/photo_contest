class Contestant < ActiveRecord::Base
  has_many :contestant_entries


  #attr_accessible
  attr_accessor :agreed_to_rules
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, :presence => true,
                      :format   => { :with => email_regex }, 
                      :uniqueness => { :case_sensitive => false }

  validates :first_name, :presence => true
 # validates :last_name, :presence => true      
 # validates :address, :presence => true 
 # validates  :city, :presence => true
 # validates  :state, :presence => true
 # validates  :zip, :presence => true, :numericality => true, :length => { :is => 5 }
 # validates :phone, :presence => true

#  validates :photographer, :presence => true
#  validates :location, :presence => true
#  validates :contest_source, :presence => true

  

end


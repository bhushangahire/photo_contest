class Contestant < ActiveRecord::Base
  has_many :contestant_entries
  
  #attr_accessible
  attr_accessor :agreed_to_rules
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, :presence => true,
                      :format   => { :with => email_regex }, 
                      :uniqueness => { :case_sensitive => false }

end
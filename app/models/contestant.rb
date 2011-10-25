class Contestant < ActiveRecord::Base
  has_many :contestant_entries

  #attr_accessible
  attr_accessor :agreed_to_rules
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, :presence => true
  validates :last_name, :presence => true      
  validates :address, :presence => true 
  validates  :city, :presence => true
  validates  :state, :presence => true
  validates  :zip, :presence => true, :numericality => true, :length => { :is => 5 }
  validates :phone, :presence => true
  validates :email, :presence => true,
                      :format   => { :with => email_regex }, 
                      :uniqueness => { :case_sensitive => false }
#  validates :photographer, :presence => true
#  validates :location, :presence => true
#  validates :contest_source, :presence => true

  def current_entry
    return ContestantEntry.new
  end 

end
# == Schema Information
#
# Table name: contestants
#
#  id             :integer         not null, primary key
#  first_name     :string(255)
#  last_name      :string(255)
#  address        :string(255)
#  city           :string(255)
#  state          :string(255)
#  zip            :string(255)
#  phone          :string(255)
#  email          :string(255)
#  photographer   :string(255)
#  location       :string(255)
#  contest_source :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

#  contest_source :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

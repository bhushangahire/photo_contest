require 'spec_helper'

describe Contestant do
 
  before(:each) do
    @attr = { 
       :email        => "sam@gresmo.com"
    }
  end

    it "should create a new instance given valid attributes" do
      Contestant.create!(@attr)
    end

    it "should require all attributes" do
      #for now assume all to be blank      
      blank_contesant = Contestant.new
      blank_contesant.should_not be_valid
    end
    
    it "should have some detailed atttribute tests" do
      pending("get detailed attribute tests")
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


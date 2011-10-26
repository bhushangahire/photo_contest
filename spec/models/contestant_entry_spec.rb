require 'spec_helper'

describe ContestantEntry do

   #to make Contestant,  should be a Factory deal
   before(:each) do
    @contestant= Factory(:contestant)
    @entry_attr = { 
       :photographer => "Fred Hickler",
       :location     => "Cyclopean Elipsoid",
       :contest_source => "contest_source",
       :photographer   => "photographer",
       :location       => "location",
       :contest_source => "email",
       :photo =>  File.new(Rails.root + 'spec/fixtures/images/right_size.jpg')
    }
  end
   
    it "should create an entry" do    
       contestant_entry = @contestant.contestant_entries.create!(@entry_attr)
    end
    
    it "should be able to create three entries" do    
      contestant_entry = @contestant.contestant_entries.create!(@entry_attr)
      contestant_entry = @contestant.contestant_entries.create!(@entry_attr)
      contestant_entry = @contestant.contestant_entries.create!(@entry_attr)
      @contestant.contestant_entries.count.should ==  3
    end

    it "Contestant should not be able to create four entries" do   
      contestant_entry = @contestant.contestant_entries.create!(@entry_attr)
      contestant_entry = @contestant.contestant_entries.create!(@entry_attr)
      contestant_entry = @contestant.contestant_entries.create!(@entry_attr)
      contestant_entry = @contestant.contestant_entries.build(@entry_attr)
      contestant_entry.should_not be_valid
      @contestant.should_not be_valid
    end  

    it "should not be able to create with blank photo" do
     attr_blank_photo = @entry_attr.merge(:photo =>nil)
     no_photo_contest_entry  =  @contestant.contestant_entries.build( attr_blank_photo)
     no_photo_contest_entry.should_not be_valid
    end

    it "should only accept image type attachments" do
      attr_blank_photo = @entry_attr.merge(:photo =>nil)
     no_photo_contest_entry  =  @contestant.contestant_entries.build( attr_blank_photo)
     no_photo_contest_entry.should_not be_valid
    end 

    describe "images should only be of acceptable size" do

      it "should reject small photos" do
       small_photo = File.new(Rails.root + 'spec/fixtures/images/small.jpg')
       attr_small_photo = @entry_attr.merge(:photo =>small_photo)
       contestant_entry = @contestant.contestant_entries.build(attr_small_photo)    
       contestant_entry.should_not be_valid
      end
    
      it "should reject big photos" do
       big_photo = File.new(Rails.root + 'spec/fixtures/images/big.png')
       attr_big_photo = @entry_attr.merge(:photo =>big_photo)
       contestant_entry = @contestant.contestant_entries.build(attr_big_photo)    
       contestant_entry.should_not be_valid
      end
    
    end 

 end

# == Schema Information
#
# Table name: contestant_entries
#
#  id                 :integer         not null, primary key
#  contestant_id      :integer
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :string(255)
#  photo_update_at    :datetime
#  created_at         :datetime
#  updated_at         :datetime
#


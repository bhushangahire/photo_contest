require 'spec_helper'


describe ContestantEntriesController do
    
   describe "GET 'show'" do
    before(:each) do
       @contestant_entry = Factory(:contestant_entry)
       @contestant_entry.id = 1      
    end
    
    it "should be successful" do      
      get :show, :id => @contestant_entry
      response.should be_success
    end    
    
    it "should have content" do
      pending
      #get :show , :id => @contestant_entry     
      #response.should have_selector("h1")                
    end
    
    it "should only be available to authenticated users" do
      pending("Not Yet Impleemented")
    
    
   
   end
   
   describe "GET 'index'" do
    it "should be successful" do      
      get :index
      response.should be_success
    end
    it "should have links within images" do      
      pending("Should test after making at least one image")
    end        
    it "should only be available to authenticated users"
      pending("")
    end   
   end
   
   
end

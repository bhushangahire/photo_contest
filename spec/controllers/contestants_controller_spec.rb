require 'spec_helper'

describe ContestantsController do

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
    
    it "should have a State drop down" do
      pending
      #get 'new'      
     # response.should have_selector("select[name='contestant_entry[state]']")                
    end
    
  end
  
  

end

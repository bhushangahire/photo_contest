require 'spec_helper'

describe PagesController do
    describe "GET 'rules'" do    
      it "should be successful" do
        get :rules
        response.should be_success
      end
    end
    describe "GET 'home'" do    
      it "should be successful" do
        get :home
        response.should be_success
      end
    end

end

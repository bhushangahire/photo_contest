class ContestantMailer < ActionMailer::Base
  default from: "mail@picthiscontest.com"
  
  def thank_you_email(contestant)
    @brand_name = PhotoContest::Application.config.brand_name 
    @brand_url  = PhotoContest::Application.config.brand_url
    #@url = "http://example.com/login"  #do we need to this set this?
    mail(:to =>  contestant.email,  
         :subject => "Got it! Your photo has been received.")
  end 

end

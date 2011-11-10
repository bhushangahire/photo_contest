class ContestantsController < ApplicationController

  def new    
    @title = "PICTURE THIS! Calendar Contest"
    @contestant = Contestant.new
    @contestant_entry = ContestantEntry.new 
  end
  
  def show
    @contestant = Contestant.find(params[:id])
    @title = "PICTURE THIS! Calendar Contest"
   if flash[:notice] = "Success"
    @success = true
   end
  end

  def create  
    @contestant = get_customer_by_email_param   
    @contestant_entry = @contestant.contestant_entries.build(params[:contestant_entry])
    if @contestant.save      
      flash[:now]= "Success"
      ContestantMailer.thank_you_email(@contestant).deliver       
      redirect_to @contestant
   else
    debugger
    @title = "PICTURE THIS! Calendar Contest" 
    render 'new'
   end
  end
  
  def update    
   debugger
   @contestant = get_customer_by_email_param
   @contestant_entry =  @contestant.contestant_entries.build(params[:contestant_entry])
   debugger 
   if @contestant.save
    ContestantMailer.thank_you_email(@contestant).deliver 
    flash[:now] = "Success"      
    redirect_to @contestant
   else    
    @title = "PICTURE THIS! Calendar Contest"
    render 'new'
   end
  end
  
  def index
    redirect_to :new_contestant
  end
  
  private
  
  #is this contestant is a returning customer
  def get_customer_by_email_param
    email = params[:contestant][:email].strip
    contestant = Contestant.find_by_email(email)
    if  contestant.nil?
     contestant = Contestant.new(params[:contestant])
     end
    return contestant
  end


end

class ContestantsController < ApplicationController

  def new
    @title = "Picture this Calendar contest - Enter"
    @contestant = Contestant.new
    @entry = ContestantEntry.new 
  end
  
  def show
     @contestant = Contestant.find(params[:id])
     @title = "Picture this Calendar contest - Enter"
     if flash[:notice] = "Success"
       @success = true
     end
  end

  def create  
   @contestant = get_customer_by_email_param   
   @contestant.contestant_entries.build(params[:contestant_entry])
   if @contestant.save      
      flash[:notice]= "Success"      
      redirect_to @contestant
   else
    @title = "Picture this Calendar contest - Enter" 
    render 'new'
   end
  end
  
  def update
   @contestant = get_customer_by_email_param
   entry = @contestant.contestant_entries.build(params[:contestant_entry])
   if @contestant.save
      flash[:notice] = "Success"      
      redirect_to @contestant
   else
    @title = "Picture this Calendar contest - Enter"
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



  #def build_contestant_entry
    #entry.photo =  params[:contestant_entry][:photo]
  #  return entry  
  #end

end

class ContestantsController < ApplicationController

  def new
    @contestant = Contestant.new
    @entry = ContestantEntry.new 
  end
  
  def show
    @contestant = Contestant.find(params[:id])
  end

  def create  
   @contestant = get_customer_by_email_param   
   @contestant.contestant_entries.build(params[:contestant_entry])
   if @contestant.save
      flash[:success] = "Thank you for submission!"
      redirect_to @contestant
   else     
    render 'new'
   end
  end
  
  def update
   @contestant = get_customer_by_email_param
   entry = @contestant.contestant_entries.build(params[:contestant_entry])
   if @contestant.save
      flash[:success] = "Thanks for submission!"
      redirect_to @contestant
   else
    render 'new'
   end
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


  def build_contestant_entry
    
    
    #entry.photo =  params[:contestant_entry][:photo]
    return entry  
  end

end

class ContestantsController < ApplicationController

  def new
    @contestant = Contestant.new      
  end

  def show
    @contestant = Contestant.find(params[:id])
  end

  def create
   create_or_update
  end
  
  def update
    create_or_update
  end
  
  private
  
  def create_or_update
   @contestant = get_customer_by_email_param       
   @contestant_entry = build_contestant_entry      
   if @contestant.save
      flash[:success] = "Thank you for submission!"
      redirect_to @contestant
   else     
    render 'new'
   end
  end
  
     
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
    entry = @contestant.contestant_entries.build(params[:contestant_entry])
    #entry.photo =  params[:contestant_entry][:photo]
    return entry  
  end

end

class ContestantEntriesController < ApplicationController
  before_filter :authenticate_user!
      
  def index    
    @contestants = Contestant.paginate(:page => params[:page], :per_page => 10)
  end

  def update   
   @contestants = Contestant.paginate(:page => params[:page], :per_page => 10)
   
   entry = ContestantEntry.find(params[:id])   
   entry.rating = params[:entry][:rating]
   entry.month_rated_for = params[:entry][:month_rated_for]
   debugger
   if entry.save
    flash[:notice] = "Vote recorded for #{entry.contestant.email}"
    redirect_to contestant_entries_path   
   else    
    flash[:now] = "Your rating for #{entry.contestant.email} was not saved.  Please put a numeric rating"
    redirect_to contestant_entries_path
   end   
  end
  
  def show
    @entry =  ContestantEntry.find(params[:id])
  end

end

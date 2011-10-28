class ContestantEntriesController < ApplicationController
      
  def index    
    @contestants = Contestant.paginate(:page => params[:page], :per_page => 2)
  end

  def update   
   @contestants = Contestant.paginate(:page => params[:page], :per_page => 2)
   
   entry = ContestantEntry.find(params[:id])    
   entry.rating = params[:entry][:rating]   
   if entry.save
    flash[:notice] = "Vote recorded for #{entry.contestant.email}"
    redirect_to contestant_entries_path   
   else    
    flash[:now] = "Your rating for #{entry.contestant.email} was not saved.  Please put a numeric rating"
    redirect_to contestant_entries_path
   end   
  end 

end

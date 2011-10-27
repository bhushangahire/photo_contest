class ContestantEntriesController < ApplicationController
      
  def index
    #@contestants = Contestant.find(:all)
    @contestants = Contestant.paginate(:page => params[:page], :per_page => 2)
  end

  def update
   #@contestants = Contestant.find(:all)
   @contestants = Contestant.paginate(:page => params[:page], :per_page => 2)
   
   entry = ContestantEntry.find(params[:id])
   entry.reload
   entry.rating = params[:contestant_entry][:rating]   
   if entry.save      
    render 'index'
   else
     flash[:now] = "LOAM YOU FUCKED UP"
     entry.errors.each do |err|
      flash[:now] = err.to_s       
     end
     flash[:now] += "  Photo size " + entry.photo.size
    render 'index'
   end   
  end 

end

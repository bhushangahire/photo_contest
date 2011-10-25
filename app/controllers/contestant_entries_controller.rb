class ContestantEntriesController < ApplicationController
      
  def index
    @contestants = Contestant.find(:all)
  end

  def update
   entry = ContestantEntry.find(params[:id])  
   entry.rating = params[:contestant_entry][:rating]
   if entry.save
      flash[:now] = params
      redirect_to entry.contestant
   else     
    render 'index'
   end   
  end 

end

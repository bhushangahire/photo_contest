class ContestantsController < ApplicationController

  def new
    @contestant = Contestant.new      
  end

  def show
    @contestant = Contestant.find(params[:id])
  end

  def create
   @contestant = Contestant.new(params[:contestant])
    
   @contestant_entry = @contestant.contestant_entries.build(params[:contestant_entry])
   
   if @contestant.save
      flash[:success] = "Thank you for submission!"
      redirect_to @contestant
   else     
    render 'new'
   end
  end

end

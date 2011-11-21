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

  def top_ten
    @ratings_by_month = get_ratings_by_month    
  end 

  def stats
    @stats = ContestantEntry.stats
  end  

  private


  def get_ratings_by_month
    #move to model
    entries = ContestantEntry.find_by_sql(
                 "SELECT 
                   rating, 
                   month_rated_for, 
                   id, 
                   contestant_id, 
                   photo_file_name, 
                   photo_content_type 
                  FROM  contestant_entries
                  WHERE rating is not null 
                  ORDER by month_rated_for,  rating"
                  )
     
     # An hash of arrays for the ratings by month 
     ratings_by_month =  Hash.new
     # aggregate entries for each month
     (1..12).each do |i| 
       # select all the entries rated for the curren month i into a new array
       one_months_ratings = entries.select{ |entry| entry.month_rated_for == i }       
       
       #put it in the bucket      
       ratings_by_month[i] =  one_months_ratings     
       
 
     end
     # and an extra slot for month not specified 
     ratings_by_month[13] = entries.select{ |entry| entry.month_rated_for.nil? }       

     return  ratings_by_month  
  end 
  

end

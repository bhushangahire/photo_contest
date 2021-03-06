class ContestantEntry < ActiveRecord::Base
  belongs_to :contestant
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  attr_accessible :photo, :rating , :first_name, :last_name, :address, :address2,
                  :city, :state, :zip, :phone, :photographer, :location, :contest_source,
                  :agreed_to_rules, :month_rated_for

  
  validate :limit_to_three_entries , :on => :create
  
  validates_attachment_presence :photo, :message => "You must attach a photo."                    

  # #problematic call, handling in a custom method
  #  validates_attachment_size  :photo,:less_than=>20.megabyte,:greater_than=>1.megabyte,:message => "Photo size must be between 1 and 20 Megabytes",:allow_nil => true



   def self.stats
    begin
 
      stats = Hash.new
      # Total Submissions  -- total = select count(*) from contestant_entries 
      total_entries = ContestantEntry.connection.select_one("SELECT count(*) as total_entries 
                                                               FROM contestant_entries")
 
      stats = stats.merge(total_entries)
 

      total_rated =  ContestantEntry.connection.select_one("SELECT count(*) as total_rated
                                                              FROM contestant_entries 
                                                              WHERE rating is not null")
 
      stats = stats.merge(total_rated)
      
      total_unrated = total_entries["total_entries"]- total_rated["total_rated"]
      stats["total_unrated"] = total_unrated
 
      return stats
    end    
  end 
  
  #image/pjpeg is for IE compatality
  
  validates_attachment_content_type :photo, :content_type=>['image/jpeg', 'image/png', 'image/tiff', 'image/pjpeg']   
  validate :size_acceptable, :on => :create
  validates :agreed_to_rules, :presence     => true  
  validates :first_name, :presence => true
  validates :last_name, :presence => true      
  validates :address, :presence => true
  
  validates :city, :presence => true
  validates :state, :presence => true
  validates :zip, :presence => true, :numericality => true, :length => { :is => 5 }
  validates :phone, :presence => true
  validates :photographer, :presence => true
  validates :location, :presence => true
  validates :contest_source, :presence => true
 
  private
  #make sure there are only three contesant entries for the corresponding contesant  
  def limit_to_three_entries    
    begin
      #todo  review test coverage
      #get prior entries from corresponding contesant      
      #no entries, no problem      
      if self.contestant.blank?    
        return
      else
        prior_entries = self.contestant.contestant_entries        
      #less than thee, no problem
      end
      if prior_entries.size < 3      
        return 
      else  
       errors.add(:base, "You are only allowed 3 entries.") 
      end
    end    
  end

  private
  
  def size_acceptable    
      if photo.nil? || photo.size.nil?
        return
      end
      size = photo.size
      if  size >20.megabyte
        errors.add(:photo, "Size must be smaller than 20 megabytes.")
      elsif   size < 1.megabyte
         errors.add(:photo, "Size must be greater than 1 megabyte.")
      end    
  end
  
end

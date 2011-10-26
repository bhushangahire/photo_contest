class ContestantEntry < ActiveRecord::Base
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  belongs_to :contestant
  
  #validate_on_create :no_more_three_entries
  validate :limit_to_three_entries 
  
  validates_attachment_presence :photo                    
  validates_attachment_size   :photo, :less_than=>20.megabyte, :greater_than=>1.megabyte
  validates_attachment_content_type :photo, :content_type=>['image/jpeg', 'image/png', 'image/gif'] 

  #make sure there are only three contesant entries for the corresponding contesant
  
  private
    
  def limit_to_three_entries    
  begin  
    #get prior entries from corresponding contesant     
    prior_entries = self.contestant.contestant_entries    
    #no entries, no problem      
    if prior_entries.empty?    
      return
    #less than two, no problem
    elsif  prior_entries.size <= 2      
      return
    else  
     errors.add(:base, "Too many contest entries") 
    end
   end    
  end

  
end

# == Schema Information
#
# Table name: contestant_entries
#
#  id                 :integer         not null, primary key
#  contestant_id      :integer
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :string(255)
#  photo_update_at    :datetime
#  created_at         :datetime
#  updated_at         :datetime
#


module ContestantEntryHelper
  
   def get_entry (entries, entry_number)
     
     return entries[entry_number-1] unless entries.nil?
   end
   
end

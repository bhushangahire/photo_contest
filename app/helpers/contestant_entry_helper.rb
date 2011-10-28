module ContestantEntryHelper
  
   def get_entry (entries, entry_number)     
     return entries[entry_number-1] unless entries.nil?
   end
   
   def list_of_numbers(upper_bound)
     list = Hash.new
     nums = (1..upper_bound).to_a
     nums.each do |i|
       list[i.to_s] = i.to_s
     end
   end
   
end

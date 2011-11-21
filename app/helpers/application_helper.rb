module ApplicationHelper
  
  def get_brand
    return PhotoContest::Application.config.brand_name
  end
  
  def get_brand_url
     #return link_to(get_brand, "www.usagencies.com")
     return PhotoContest::Application.config.brand_url     
  end
  
  def get_branded_asset (asset_name)
     return PhotoContest::Application.config.brand_dir + "/" + asset_name    
  end
  
  def get_month_if_rated (entry)
    if entry && entry.month_rated_for
      return Date::MONTHNAMES[entry.month_rated_for]
    else
      return ""
    end    
  end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
  def get_month_name(month_number)
    return Date::MONTHNAMES[month_number]
  end

  def custom_errors_flag(contestant)
    custom_messages = Hash.new
    # if there were errors on the entry
    if contestant.contestant_entries.last.errors
      # note a photo error if present
      if contestant.contestant_entries.last.errors.messages[:photo]
        custom_messages[:photo] =  true            
      end
      #  note 1 time only that other errors were present
      if custom_messages[:other].nil?
          custom_messages[:other] = true
      end
    end
    #  note 1 time only that other errors were present  
    if contestant.errors && custom_messages[:other].nil?
      custom_messages[:other] = true
    end
    return custom_messages
  end
end

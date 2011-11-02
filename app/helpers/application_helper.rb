module ApplicationHelper
  
  def get_brand
    return "USAgencies"
  end
  
  def get_brand_url
     #return link_to(get_brand, "www.usagencies.com")
     return 
  end
  
  def get_month_if_rated (entry)
    if entry && entry.month_rated_for
      return Date::MONTHNAMES[entry.month_rated_for]
    else
      return ""
    end
    
  end
end

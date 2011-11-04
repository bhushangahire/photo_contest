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
end

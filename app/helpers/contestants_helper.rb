module ContestantsHelper
 
  def tentaculos_pixel_url

    random_number = (1 + rand(100000)).to_s

    brand = PhotoContest::Application.config.brand_dir  
   
    if brand == "IO"
      #Afirmative InsureOne Conversions - Pixel
      url = "https://t1.tentaculos.net/image/11110223399/_PM_STATUS/,1/cb," + random_number
    elsif brand == "DC"
      #Affirmative Drivers Choice Conversions - Pixel
      url ="https://t1.tentaculos.net/image/11110223466/_PM_STATUS,1/cb," + random_number
    elsif brand == "US"
      #Affirmative US Agencies Conversions - Pixel
      url = "https://t1.tentaculos.net/image/11110223467/_PM_STATUS,1/cb,"+ random_number  
    elsif brand == "AA"
      #Affirmative A-Affordable Conversions - Pixel
      url = "https://t1.tentaculos.net/image/11110223468/_PM_STATUS,1/cb," + random_number
    else  #brand not configured 
      url = ""
    end 

   return url
  end

end

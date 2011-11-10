 
#change this configuration element to change the brand
PhotoContest::Application.config.brand_name = "AA"
# not this is an initalizer, rails app restart is required to reflect changes

if PhotoContest::Application.config.brand_name == "AA"
#A-Affordable
  PhotoContest::Application.config.brand_name = "A-Affordable"
  PhotoContest::Application.config.brand_dir = "AA"
  PhotoContest::Application.config.brand_url  = "http://www.aaffordableauto.com/"
  PhotoContest::Application.config.header_flash_asset_path  = "AA/affirmative_flash_aa.swf"
  PhotoContest::Application.config.header_offerbox_asset_path  = "AA/offerbox.png"
  PhotoContest::Application.config.logo_asset_path  = "AA/aalogo.png"
  
elsif PhotoContest::Application.config.brand_name == "IO"
  #InsureOne
  PhotoContest::Application.config.brand_name = "InsureOne"
  PhotoContest::Application.config.brand_dir = "IO"
  PhotoContest::Application.config.brand_url  = "http://www.insureone.com/"
  PhotoContest::Application.config.header_flash_asset_path  = "IO/affirmative_flash_io.swf"
  PhotoContest::Application.config.header_offerbox_asset_path  = "IO/offerbox.png"
  PhotoContest::Application.config.logo_asset_path  = "IO/iologo.png"
  
elsif PhotoContest::Application.config.brand_name == "DC"
  PhotoContest::Application.config.brand_name = "DriversChoice"
  PhotoContest::Application.config.brand_dir = "DC"
  PhotoContest::Application.config.brand_url  = "http://www.driverschoiceinsurance.com/"
  PhotoContest::Application.config.header_flash_asset_path  = "DC/affirmative_flash_dc.swf"
  PhotoContest::Application.config.header_offerbox_asset_path  = "DC/offerbox.png"
  PhotoContest::Application.config.logo_asset_path  = "DC/DClogo.png"
  
elsif PhotoContest::Application.config.brand_name == "US"
  PhotoContest::Application.config.brand_name = "USAgencies"
  PhotoContest::Application.config.brand_dir = "US"
  PhotoContest::Application.config.brand_url  = "http://www.USAgencies.com/"
  PhotoContest::Application.config.header_flash_asset_path  = "US/affirmative_flash.swf"
  PhotoContest::Application.config.header_offerbox_asset_path  = "US/offerbox.png"
  PhotoContest::Application.config.logo_asset_path  = "US/usalogo.png"
  
else
  raise "Brand is not configured"
  
end



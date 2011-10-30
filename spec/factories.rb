Factory.sequence :email do |n|   
  "person-#{n}@example.com"
end

Factory.define :contestant do |contestant|
  contestant.email       "person-0@example.com"   
end

Factory.define :contestant_entry do |contestant_entry|
  begin   
    contestant_entry.first_name    "first_name"
    contestant_entry.last_name     "last_name"
    contestant_entry.address  "address"
    contestant_entry.city  "city"
    contestant_entry.state  "IL"
    contestant_entry.zip  "66666"
    contestant_entry.phone  "312-123-5551"    
    contestant_entry.location      "Cyclopean Elipsoid"
    contestant_entry.contest_source  "contest_source"
    contestant_entry.photographer    "photographer"    
    contestant_entry.agreed_to_rules  "true"
    contestant_entry.photo   File.new(Rails.root + 'spec/fixtures/images/right_size.jpg')
  end
end






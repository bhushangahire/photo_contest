# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :contestant do |contestant|
  contestant.email          "sam@example.com"    
end


Factory.sequence :email do |n|   
  "person-#{n}@example.com"
end



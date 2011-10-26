# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :contestant do |contestant|
  contestant.email          "sam@example.com"  
  contestant.first_name     "John"
  contestant.last_name      "Doe"
end


Factory.sequence :email do |n|   
  "person-#{n}@example.com"
end



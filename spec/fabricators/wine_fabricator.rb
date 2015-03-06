Fabricator(:wine) do
  description { Faker::Lorem.sentence }
  vintage { (1960..2014).to_a.sample } 
end
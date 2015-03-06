Fabricator(:tasting_note) do
  tasting_date { Faker::Date.backward(30) }
  quality { Faker::Lorem.word }
  comments { Faker::Lorem.sentence} 
end
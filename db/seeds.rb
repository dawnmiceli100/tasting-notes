## This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# WineTypes
WineType.create(name: "Red")
WineType.create(name: "White")
WineType.create(name: "Rose")
WineType.create(name: "Sparkling")

# Flavors
Flavor.create(name: "Fruits")
Flavor.create(name: "Flowers")
Flavor.create(name: "Spices")
Flavor.create(name: "Vegetables")
Flavor.create(name: "Oak")
Flavor.create(name: "Other")

# Aromas
Aroma.create(name: "Fruits")
Aroma.create(name: "Flowers")
Aroma.create(name: "Spices")
Aroma.create(name: "Vegetables")
Aroma.create(name: "Oak")
Aroma.create(name: "Other")

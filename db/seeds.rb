# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(first_name: "Saundra", last_name: "Castaneda", email: "svcastaneda@gmail.com", username: "saundoritos", password: "password", birthday: "1995-12-01", xp_years: 10, housing_type: "apartment", sitter: false, city: "Chicago", state: "IL", country: "USA", zip_code: "60606")

dog = Dog.create(name: "Sammy", birthday: "2008-07-03", breed: "shetland sheepdog", size: "M", owner: user)
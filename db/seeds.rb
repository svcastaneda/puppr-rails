# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(first_name: "Saundra", last_name: "Castaneda", email: "svcastaneda@gmail.com", username: "saundoritos", password: "password", birthday: "1995-12-01")

profile = Profile.create(user: user, sitter: false, housing_type: "apartment", xp_years: 10, city: "Chicago", state: "IL", country: "USA", zip_code: "60606")

sitter = User.create(first_name: "Adriana", last_name: "Castaneda", email: "adriana@gmail.com", username: "adriana", password: "password", birthday: "1992-07-23")

sitter_profile = Profile.create(user: sitter, sitter: true, housing_type: "apartment", xp_years: 14, city: "Chicago", state: "IL", country: "USA", zip_code: "60606")

dog = Dog.create(name: "Sammy", birthday: "2008-07-03", breed: "shetland sheepdog", size: "M", owner: user)
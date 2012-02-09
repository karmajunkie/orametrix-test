# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'
CSV.foreach("db/hotels.csv", :headers => true) do |row|
  city = City.find_or_create_by_name(row['city'])
  hotel = Hotel.find_or_create_by_name_and_city_id(row["name"],city.id)
  hotel.description = row["description"]
  hotel.rate = row["rate"].to_f
  hotel.star_rating = row["star_rating"].to_i
  hotel.address = row['address']
  hotel.save!
end
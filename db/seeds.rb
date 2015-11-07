# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { nycleame: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Cycle.create({status: 'OPEN',bike_stands: 30, available_bike_stands: 20,available_bikes: 8,cycle_reference_id: 1})
CycleReference.create({name: "first stand", address: "30 rue de velo", latitude: 48.6919579483934, longitude: 6.17851021950761, number: 1})
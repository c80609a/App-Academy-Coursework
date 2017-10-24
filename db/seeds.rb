# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all

CatRentalRequest.destroy_all

cat1 = Cat.create(birthdate: Date.new(2013,3,23), color: 'brown', sex: 'F', name: 'Florence', description: "Badass cat")
cat2 = Cat.create(birthdate: Date.new(1508,4,12), color: 'black', sex: 'M', name: "Mike", description: "Very old cat")
cat3 = Cat.create(birthdate: Date.new(1700,6,30), color: 'gray', sex: 'F', name: "Michelle", description: "Cool cat")
cat4 = Cat.create(birthdate: Date.new(1889,11,9), color: 'black', sex: 'M', name: "BatMan", description: "Crayyyzy cat")


rental1 = CatRentalRequest.create(cat_id: cat1.id, status: 'APPROVED', start_date: Date.new(2015,1,1), end_date: Date.new(2015,1,3))
rental2 = CatRentalRequest.create(cat_id: cat2.id, status: 'APPROVED', start_date: Date.new(2015,3,1), end_date: Date.new(2015,3,6))
rental3 = CatRentalRequest.create(cat_id: cat3.id, status: 'APPROVED', start_date: Date.new(2015,5,1), end_date: Date.new(2015,5,3))
rental4 = CatRentalRequest.create(cat_id: cat2.id, status: 'APPROVED', start_date: Date.new(2015,3,2), end_date: Date.new(2015,3,10))
rental5 = CatRentalRequest.create(cat_id: cat3.id, status: 'APPROVED', start_date: Date.new(2015,5,1), end_date: Date.new(2015,5,2))

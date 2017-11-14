# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
todo1 = Todo.create(title: "Wash the Dog", body: "with soap", done: false)
todo12 = Todo.create(title: "Wash the cat", body: "with soap", done: false)
todo3 = Todo.create(title: "Wash the Turtle", body: "with soap", done: false)
todo4 = Todo.create(title: "Wash the Dog Again", body: "with soap", done: true)

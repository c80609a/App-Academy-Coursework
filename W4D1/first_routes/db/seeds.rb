# # This file should contain all the record creation needed to seed the database
# with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside
# the database with db:setup).
# #
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

u1 = User.create({ username: 'leo'})
u2 = User.create({ username: 'derf'})
u3 = User.create({ username: 'christina'})
u4 = User.create({ username: 'c'})
Artwork.create([{title: 'one', img_url: 'abc', artist_id: u1.id}, {title: 'two', img_url: 'def', artist_id: u2.id}])

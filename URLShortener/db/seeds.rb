# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


chase = User.create!(email: 'chase@chasebank.com')
christina = User.create!(email: 'christina@wh.gob')

ShortenedUrl.create_url(chase, "www.doyouwantmoney.edu")
ShortenedUrl.create_url(christina, "www.nomoney.org")

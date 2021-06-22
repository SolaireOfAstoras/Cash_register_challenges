# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
products = Product.create([{ name: 'Green Tea', image: 'https://media.gettyimages.com/photos/green-tea-on-bamboo-picture-id543482115?k=6&amp;m=543482115&amp;s=612x612&amp;w=0&amp;h=3X4p1NzJA5I-fjIp4xXUJlmZRZJefIozukoFM16Ahlg=', description: 'GR1', price: "3.11" },
  { name: 'Strawberry', image: 'https://media.gettyimages.com/photos/fresh-strawberry-closeup-picture-id73264456?k=6&amp;m=73264456&amp;s=612x612&amp;w=0&amp;h=3vdp1VrMjdLZ9J0JaIIwfeFx37FroGfAHTa7693rkkU=', description: 'SR1', price: "5.00" },
  { name: 'Coffe', image: 'https://media.gettyimages.com/photos/coffee-with-cream-picture-id1265217753?k=6&amp;m=1265217753&amp;s=612x612&amp;w=0&amp;h=ntsbKe6F1G9_9pQCUHgnRv8SEfQwd9265wX7OJhYG4E=', description: 'CF1', price: "11.23" }])

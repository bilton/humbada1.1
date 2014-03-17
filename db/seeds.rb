# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create!(
	title: "Humbada 1.0", 
	price: 5.0,
	description: 'This is the first test product',
	image_url: 'humbada1.jpg')

Product.create!(
	title: "Humbada 2.0", 
	price: 10.5,
	description: 'This is the second test product',
	image_url: 'humbada2.jpg')

Product.create!(
	title: "Humbada 3.0", 
	price: 100.50,
	description: 'This is the third test product',
	image_url: 'humbada3.jpg')
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Item.create([
	{ family: 'shirt', style: 'business', title: 'Regular Fit Check Dress Shirt', store: 'Nordstrom', brand: 'David Donahue', url: 'http://shop.nordstrom.com/s/nordstrom-non-iron-classic-fit-gingham-dress-shirt-online-only/3744119?origin=category-personalizedsort&contextualcategoryid=0&fashionColor=Orange+Sunset&resultback=1272' },
	{ family: 'shirt', style: 'business', title: 'Non-Iron Classic Fit Gingham Dress Shirt (Online Only)', store: 'Nordstrom', brand: 'Nordstrom', url: 'http://shop.nordstrom.com/s/david-donahue-regular-fit-check-dress-shirt/3904709?origin=category-personalizedsort&contextualcategoryid=0&fashionColor=&resultback=1166' },
])

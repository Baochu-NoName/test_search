# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create(title: 'Sport wears', body: Faker::Lorem.sentence)
Category.create(title: 'Electronics', body: Faker::Lorem.sentence)
Category.create(title: 'Women Clothes', body: Faker::Lorem.sentence)
Category.create(title: 'Men Clothes', body: Faker::Lorem.sentence)
Category.create(title: 'Games', body: Faker::Lorem.sentence)

5.times do |t|
	product = Product.create( name: Faker::Commerce.product_name,
					description: Faker::Lorem.paragraph(sentence_count: 10),
					price: Faker::Commerce.price,
					category_id: Faker::Number.between(from: 1, to: Category.count)
					)
	product.image.attach(io: File.open(Rails.root.join('app/assets/images/list.png')),
                  filename: 'list.png')	
	product.save
end

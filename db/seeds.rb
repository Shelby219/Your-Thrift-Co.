# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Category.create(name: 'Tops')
Category.create(name: 'Dresses & Skirts')
Category.create(name: 'Pants')
Category.create(name: 'Jackets')
Category.create(name: 'Shoes')
Category.create(name: 'Jewellery')
Category.create(name: 'Accessories')

# #create some test users    
#  for i in 1..5
#      User.create(
#          username: "username#{i}",
#          email: "#{i}@test.com",
#          password: "123456"
#      )
#      puts "created #{i} users"
#  end

#  #create some test items
#  for i in 1..30
#      Item.create(
#          title: Faker::Name.middle_name,
#          description: Faker::Lorem.paragraph(sentence_count: rand(2..10)),
#          price: Faker::Number.between(from: 5, to: 60), 
#         user_id: Faker::Number.between(from: 1, to: 5)
#         )
#      puts "Created #{i} listings"
#  end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.destroy_all()
Enquiry.destroy_all()
Admin.destroy_all()

bigdog = Admin.create(username: 'test_1', email: 'test_1@test.com', password: 'password', password_confirmation: 'password')

Post.create(name: "Install at xxxx", text: "Did some install it was sick as aye", admin: bigdog)

Enquiry.create(first_name: "Jed", last_name: "Foxxyton", organisation: "BigHole", email: "poo@email", phone_number: 04213222542, description: "I want some work done m8", admin: bigdog )
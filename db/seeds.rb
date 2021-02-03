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

bigdog = Admin.create(username: 'Steven', email: 'customledscreensolutions@gmail.com', password: 'password', password_confirmation: 'password')

lildog = 10.times do |i|
    Post.create!(
    name: "Install at Showgirls CBD", 
    text: "Quote cost $2500, installed for $1000", 
    admin: bigdog
)
end

10.times do |i|
    Enquiry.create(
    first_name: "Vlad", 
    last_name: "Sputnik", 
    organisation: "Kremlin Garbage Bro's", 
    email: "russiansdonotuse@email", 
    phone_number: 04213222542, 
    description: "In soviet Russia Waldo finds You", 
    admin: bigdog
    )
end

# lildog.image.attach( 
#     io: File.open(Rails.root.join("app", "assets", "images", "lasagne.jpg")), 
#     filename: 'lasagne.jpg',
#     content_type: "image/jpg"
# )
# rails g migration add_image_to_posts image:image
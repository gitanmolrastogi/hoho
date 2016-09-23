# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
StaticPage.create!(title: "About Us", content: "Lorem ipsum dolor sit amet, consectetur adipiscing...")
StaticPage.create!(title: "Privacy Policy", content: "Lorem ipsum dolor sit amet, consectetur adipiscing...")
StaticPage.create!(title: "Terms and Conditions", content: "Lorem ipsum dolor sit amet, consectetur adipiscing...")
StaticPage.create!(title: "Contact Us", content: "Lorem ipsum dolor sit amet, consectetur adipiscing...")
StaticPage.create!(title: "Reservation and Sales", content: "Lorem ipsum dolor sit amet, consectetur adipiscing...")
StaticPage.create!(title: "Tips", content: "Lorem ipsum dolor sit amet, consectetur adipiscing...")
StaticPage.create!(title: "Information", content: "Lorem ipsum dolor sit amet, consectetur adipiscing...")

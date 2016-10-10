# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p 'Creating Admin user'
admin_hash = {:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password'}
AdminUser.where(admin_hash.slice(:email)).first_or_create(admin_hash)

p 'Creating About Us'
about_us={ :title => "About Us", :content=>"Lorem ipsum dolor sit amet, consectetur adipiscing..."}
StaticPage.where(about_us.slice(:title)).first_or_create(about_us)

p 'Creating Privacy Policy'
privacy_policy={ :title => "Privacy Policy", :content=>"Lorem ipsum dolor sit amet, consectetur adipiscing..."}
StaticPage.where(privacy_policy.slice(:title)).first_or_create(privacy_policy)

p 'Creating Terms and Conditions'
terms_and_condition={ :title => "Terms and Conditions", :content=>"Lorem ipsum dolor sit amet, consectetur adipiscing..."}
StaticPage.where(terms_and_condition.slice(:title)).first_or_create(terms_and_condition)

p 'Creating Contact Us'
contact_us={ :title => "Contact Us", :content=>"Lorem ipsum dolor sit amet, consectetur adipiscing..."}
StaticPage.where(contact_us.slice(:title)).first_or_create(contact_us)

p 'Creating Reservation and Sales'
reservation_and_sales={ :title => "Reservation and Sales", :content=>"Lorem ipsum dolor sit amet, consectetur adipiscing..."}
StaticPage.where(reservation_and_sales.slice(:title)).first_or_create(reservation_and_sales)

p 'Creating Tips'
tips={ :title => "Tips", :content=>"Lorem ipsum dolor sit amet, consectetur adipiscing..."}
StaticPage.where(tips.slice(:title)).first_or_create(tips)

p 'Creating Information'
information={ :title => "Information", :content=>"Lorem ipsum dolor sit amet, consectetur adipiscing..."}
StaticPage.where(information.slice(:title)).first_or_create(information)



file  = File.open(File.join(Rails.root,'app/assets/images/bg2.jpg'))
HomePageImage.create!([{image: file,status: "Active"},{image: file,status: "Active"}])

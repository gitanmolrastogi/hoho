# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# p 'Creating Accommodation Link'
# acc={ :title => "Accommodation", :content=>"https://google.com"}
# StaticPage.where(acc.slice(:title)).first_or_create(acc)

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

p 'Creating Tips'
tips={ :title => "Tips", :content=>"Lorem ipsum dolor sit amet, consectetur adipiscing..."}
StaticPage.where(tips.slice(:title)).first_or_create(tips)

p 'Creating Contact Us'
contact_us={ :title => "Contact Us", :content=>"Lorem ipsum dolor sit amet, consectetur adipiscing..."}
StaticPage.where(contact_us.slice(:title)).first_or_create(contact_us)

p 'Creating Reservation and Sales'
reservation_and_sales={ :title => "Reservation and Sales", :content=>"Lorem ipsum dolor sit amet, consectetur adipiscing..."}
StaticPage.where(reservation_and_sales.slice(:title)).first_or_create(reservation_and_sales)

# p 'Creating Tips'
# tips={ :title => "Tips", :content=>"Lorem ipsum dolor sit amet, consectetur adipiscing..."}
# StaticPage.where(tips.slice(:title)).first_or_create(tips)

p 'Creating Who We Are'
who_we_are={ :title => "Who We Are", :content=>"Lorem ipsum dolor sit amet, consectetur adipiscing..."}
StaticPage.where(who_we_are.slice(:title)).first_or_create(who_we_are)

p 'Creating Track Your Routes'
track_your_routes={ :title => "Track Your Routes", :content=>"Lorem ipsum dolor sit amet, consectetur adipiscing..."}
StaticPage.where(track_your_routes.slice(:title)).first_or_create(track_your_routes)

p 'Creating Address'
address={ :title => "Address", :content=>"A-235 Okhla Phase-1 Delhi"}
StaticPage.where(address.slice(:title)).first_or_create(address)

p 'Creating Email'
email={ :title => "Email", :content=>"vinod.kumar@mobiloittegroup.com"}
StaticPage.where(email.slice(:title)).first_or_create(email)

p 'Creating Phone Number'
phone_number={ :title => "Phone Number", :content=>"8058904238"}
StaticPage.where(phone_number.slice(:title)).first_or_create(phone_number)

p "Creating How It Works"
file1  = File.open(File.join(Rails.root,'app/assets/images/img-1.png'))
how_it_works1={ :title => "How It Works 1" ,:content=>"Lorem ipsum dolor sit amet, consectetur adipiscing...",:image=>file1}
HowItWork.where(how_it_works1.slice(:title)).first_or_create(how_it_works1)

file2  = File.open(File.join(Rails.root,'app/assets/images/img-2.png'))
how_it_works2={ :title => "How It Works 2" ,:content=>"Lorem ipsum dolor sit amet, consectetur adipiscing...",:image=>file2}
HowItWork.where(how_it_works2.slice(:title)).first_or_create(how_it_works2)

file3  = File.open(File.join(Rails.root,'app/assets/images/img-3.png'))
how_it_works3={ :title => "How It Works 3" ,:content=>"Lorem ipsum dolor sit amet, consectetur adipiscing...",:image=>file3}
HowItWork.where(how_it_works3.slice(:title)).first_or_create(how_it_works3)

 # Home Page Images
p "Creating Home Page Images"
file  = File.open(File.join(Rails.root,'app/assets/images/bg2.jpg'))
HomePageImage.create!([{image: file,status: "Active"},{image: file,status: "Active"}])

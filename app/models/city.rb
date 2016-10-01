class City < ApplicationRecord
	has_many :photos, as: :imageable		
	has_many :city_routes
	has_many :line_color_routes , through: :city_routes 

	has_many :city_categories
	has_many :categories , through: :city_categories

	has_one  :accommodation

 accepts_nested_attributes_for :photos, :allow_destroy => true


end

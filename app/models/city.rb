class City < ApplicationRecord
	has_many :photos, as: :imageable,dependent: :destroy		
	has_many :city_routes,dependent: :destroy
	has_many :line_color_routes , through: :city_routes 

	has_many :city_categories , dependent: :destroy
	has_many :categories , through: :city_categories

	has_many :activities , dependent: :destroy

	mount_uploader :image, PhotoUploader
	before_save :convert_into_downcase_new_city

	# has_one  :accommodation

 	accepts_nested_attributes_for :photos, :allow_destroy => true

	# validates :overview, presence: true
	# validates :important, presence: true

    #validation starts here...

     validates :name, presence: true
     validates :overview, presence: true
     validates :important, presence: true

    #validation ends here...


	def convert_into_downcase_new_city
		name.downcase!
	end
end

class City < ApplicationRecord
	has_many :photos, as: :imageable,dependent: :destroy		
	has_many :city_routes,dependent: :destroy
	has_many :line_color_routes , through: :city_routes 

	has_many :city_categories , dependent: :destroy
	has_many :categories , through: :city_categories

	has_many :activities , dependent: :destroy

	mount_uploader :image, PhotoUploader


	# has_one  :accommodation

 accepts_nested_attributes_for :photos, :allow_destroy => true
validates :overview, presence: true
validates :important, presence: true


end

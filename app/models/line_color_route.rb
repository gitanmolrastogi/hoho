class LineColorRoute < ApplicationRecord
	mount_uploader :image, HomePageImageUploader
	mount_uploader :zoomed_image, HomePageImageUploader

has_many :city_routes
has_many :cities , through: :city_routes
 accepts_nested_attributes_for :cities, :allow_destroy => true
 accepts_nested_attributes_for :city_routes, :allow_destroy => true
 


end

class LineColorRoute < ApplicationRecord
	mount_uploader :image, HomePageImageUploader
	mount_uploader :zoomed_image, HomePageImageUploader

has_many :city_routes
has_many :cities , through: :city_routes


end

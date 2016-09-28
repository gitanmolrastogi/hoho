class Category < ApplicationRecord
mount_uploader :image, HomePageImageUploader

has_one :photo, as: :imageable		


has_many :city_categories
has_many :cities , through: :city_categories

end

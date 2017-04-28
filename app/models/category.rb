class Category < ApplicationRecord
mount_uploader :image, HomePageImageUploader

has_one :photo, as: :imageable		
# validates :overview, presence: true

has_many :city_categories , dependent: :destroy
has_many :cities , through: :city_categories

# has_many :info , dependent: :destroy

end

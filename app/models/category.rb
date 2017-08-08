class Category < ApplicationRecord
mount_uploader :image, HomePageImageUploader

has_one :photo, as: :imageable		
# validates :overview, presence: true

has_many :city_categories , dependent: :destroy
has_many :cities , through: :city_categories

has_many :activities , dependent: :destroy

# has_many :info , dependent: :destroy

#validation starts here...

   validates :name, presence: true
   validates :info, presence: true

#validation ends here...

end

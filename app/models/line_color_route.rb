class LineColorRoute < ApplicationRecord
mount_uploader :image, HomePageImageUploader
mount_uploader :zoomed_image, HomePageImageUploader
has_many :city_routes, dependent: :destroy
has_many :cities , through: :city_routes

belongs_to :main_route

accepts_nested_attributes_for :cities, :allow_destroy => true
accepts_nested_attributes_for :city_routes , :allow_destroy => true

#validation starts here...

   validates :name, presence: true

#validation ends here...
end

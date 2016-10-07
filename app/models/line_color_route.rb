class LineColorRoute < ApplicationRecord
	mount_uploader :image, HomePageImageUploader
	mount_uploader :zoomed_image, HomePageImageUploader
   before_save :end_point_setter



 def end_point_setter
  self.end_point = self.start_point
 end



has_many :city_routes, depnedent: :destroy
has_many :cities , through: :city_routes

 accepts_nested_attributes_for :cities, :allow_destroy => true
 accepts_nested_attributes_for :city_routes , :allow_destroy => true
 


end

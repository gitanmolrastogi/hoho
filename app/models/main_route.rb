class MainRoute < ApplicationRecord
mount_uploader :image, HomePageImageUploader
before_save :end_point_setter



 def end_point_setter
  self.end_point = self.start_point
 end
end

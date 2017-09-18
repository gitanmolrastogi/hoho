class MainRoute < ApplicationRecord
mount_uploader :image, HomePageImageUploader
#before_save :end_point_setter


has_many :orders , as: :orderable
has_many :line_color_routes , dependent: :destroy


#validation starts here...
     validates :name, uniqueness: true
   # validates :name, presence: true
   # validates :information, presence: true
   # validates :start_point, presence: true
   # validates :end_point, presence: true
   # validates :price, presence: true
   # validates :duration, presence: true

#validation ends here...

 def end_point_setter
  self.end_point = self.start_point
 end
end

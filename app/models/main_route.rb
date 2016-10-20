class MainRoute < ApplicationRecord
mount_uploader :image, HomePageImageUploader
before_save :end_point_setter


has_many :orders , as: :orderable
has_many :line_color_routes , dependent: :destroy

 def end_point_setter
  self.end_point = self.start_point
 end
end

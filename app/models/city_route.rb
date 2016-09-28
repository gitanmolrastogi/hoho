class CityRoute < ApplicationRecord
  belongs_to :line_color_route
  belongs_to :city
end

class AddColumnIsActiveToLineColorRoutes < ActiveRecord::Migration[5.0]
  def change
  	add_column :line_color_routes, :is_active, :boolean, :default=> false
  end
end

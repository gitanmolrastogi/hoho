class RemoveColumnsFromLineColorRoutes < ActiveRecord::Migration[5.0]
  def change
  	remove_column :line_color_routes, :information
  	remove_column :line_color_routes, :start_point
  	remove_column :line_color_routes, :end_point
  	add_column :line_color_routes, :main_route_id , :integer

  end
end

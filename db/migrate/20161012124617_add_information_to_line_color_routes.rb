class AddInformationToLineColorRoutes < ActiveRecord::Migration[5.0]
  def change
    add_column :line_color_routes, :information, :text
  end
end

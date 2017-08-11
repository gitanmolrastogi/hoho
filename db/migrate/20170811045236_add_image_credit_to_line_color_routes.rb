class AddImageCreditToLineColorRoutes < ActiveRecord::Migration[5.0]
  def change
  	add_column :line_color_routes, :image_credit, :string
  	add_column :line_color_routes, :image_credit_zoomed, :string
  end
end

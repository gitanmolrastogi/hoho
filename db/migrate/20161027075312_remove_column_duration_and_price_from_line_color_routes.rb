class RemoveColumnDurationAndPriceFromLineColorRoutes < ActiveRecord::Migration[5.0]
  def change
    remove_column :line_color_routes, :price, :string
    remove_column :line_color_routes, :duration, :string
  end
end

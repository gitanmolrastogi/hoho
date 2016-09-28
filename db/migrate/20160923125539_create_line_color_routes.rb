class CreateLineColorRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :line_color_routes do |t|
      t.string :name
      t.string :start_point
      t.string :end_point
      t.string :price
      t.string :duration
      t.string :image
      t.string :zoomed_image
      t.timestamps
    end
  end
end

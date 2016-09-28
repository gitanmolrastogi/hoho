class CreateCityRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :city_routes do |t|
      t.references :line_color_route, foreign_key: true
      t.references :city, foreign_key: true
      t.integer :priority

      t.timestamps
    end
  end
end

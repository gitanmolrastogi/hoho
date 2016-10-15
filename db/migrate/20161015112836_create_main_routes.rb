class CreateMainRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :main_routes do |t|
      t.string :name
      t.text :information
      t.string :start_point
      t.string :end_point

      t.timestamps
    end
  end
end

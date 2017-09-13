class AddColumnIsActiveToMainRoutes < ActiveRecord::Migration[5.0]
  def change
  	add_column :main_routes, :is_active, :boolean, :default=> false
  end
end

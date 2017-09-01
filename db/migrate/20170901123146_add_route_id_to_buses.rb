class AddRouteIdToBuses < ActiveRecord::Migration[5.0]
  def change
  	add_column :buses, :route_id, :integer
  end
end

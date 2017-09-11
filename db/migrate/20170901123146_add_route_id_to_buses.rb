class AddRouteIdToBuses < ActiveRecord::Migration[5.0]
  def change
  	add_column :buses, :route_id, :integer
  	add_column :buses, :capacity, :integer
  	add_column :buses, :frequency, :integer
  end
end

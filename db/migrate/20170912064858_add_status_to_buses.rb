class AddStatusToBuses < ActiveRecord::Migration[5.0]
  def change
  	add_column :buses, :status, :boolean, :default => false
  end
end

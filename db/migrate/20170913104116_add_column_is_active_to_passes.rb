class AddColumnIsActiveToPasses < ActiveRecord::Migration[5.0]
  def change
  	add_column :passes, :is_active, :boolean, :default=> false
  end
end

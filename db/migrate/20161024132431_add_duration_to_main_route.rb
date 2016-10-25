class AddDurationToMainRoute < ActiveRecord::Migration[5.0]
  def change
  	add_column :main_routes , :duration , :integer
  end
end

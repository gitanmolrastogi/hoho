class RemoveColumnsFromAccomodations < ActiveRecord::Migration[5.0]
  def change
  	remove_column :accommodations, :title
  	remove_column :accommodations, :city_id
  	remove_column :accommodations, :where_we_stay
  end
end

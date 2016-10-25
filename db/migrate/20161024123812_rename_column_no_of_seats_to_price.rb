class RenameColumnNoOfSeatsToPrice < ActiveRecord::Migration[5.0]
  def change
  	remove_column :buses, :no_of_seats
  end
end

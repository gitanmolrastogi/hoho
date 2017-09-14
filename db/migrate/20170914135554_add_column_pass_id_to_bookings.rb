class AddColumnPassIdToBookings < ActiveRecord::Migration[5.0]
  def change
  	add_column :bookings, :pass_id, :integer
  end
end

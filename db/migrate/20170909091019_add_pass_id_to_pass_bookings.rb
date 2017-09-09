class AddPassIdToPassBookings < ActiveRecord::Migration[5.0]
  def change
  	add_column :pass_bookings, :pass_id, :integer
  end
end

class AddStartDateAndStartTimeToBooking < ActiveRecord::Migration[5.0]
  def change
  	add_column :bookings, :start_date, :date
  	add_column :bookings, :start_time, :time
  end
end

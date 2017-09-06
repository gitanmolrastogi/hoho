class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :bus_id
      t.date :date
      t.string :route
      t.string :source
      t.string :destination
      t.time :arrival
      t.time :departure

      t.timestamps
    end
  end
end

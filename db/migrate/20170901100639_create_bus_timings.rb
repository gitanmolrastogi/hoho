class CreateBusTimings < ActiveRecord::Migration[5.0]
  def change
    create_table :bus_timings do |t|
      t.string :city
      t.time :arrival
      t.time :deperture
      t.integer :day_of_arrival
      t.integer :day_of_deperture
      t.integer :bus_id

      t.timestamps
    end
  end
end

class CreateBuses < ActiveRecord::Migration[5.0]
  def change
    create_table :buses do |t|
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.string :start_point
      t.string :end_point
      t.integer :no_of_seats
      t.boolean :is_full

      t.timestamps
    end
  end
end

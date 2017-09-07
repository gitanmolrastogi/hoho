class CreatePassBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :pass_bookings do |t|
      t.integer :user_id
      t.string :category
      t.string :route
      t.integer :hops_remaining
      t.date :valid_from
      t.date :valid_upto
      t.boolean :status
      t.boolean :default_pass

      t.timestamps
    end
  end
end

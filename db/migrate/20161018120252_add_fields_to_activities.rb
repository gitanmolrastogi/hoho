class AddFieldsToActivities < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :start_date, :date
    add_column :activities, :end_date, :date
    add_column :activities, :start_time, :time
    add_column :activities, :end_time, :time
    add_column :activities, :price, :integer
  end
end

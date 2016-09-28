class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.text :overview
      t.text :information
      t.references :city, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end

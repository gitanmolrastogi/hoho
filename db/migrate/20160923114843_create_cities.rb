class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.text :overview
      t.text :important

      t.timestamps
    end
  end
end

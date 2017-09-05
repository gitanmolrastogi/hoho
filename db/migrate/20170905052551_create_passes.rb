class CreatePasses < ActiveRecord::Migration[5.0]
  def change
    create_table :passes do |t|
      t.string :name
      t.string :category
      t.string :route_name
      t.integer :max_hops
      t.integer :validity
      t.float :price

      t.timestamps
    end
  end
end

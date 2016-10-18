class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :orderable_type
      t.integer :orderable_id
      t.references :user, foreign_key: true
      t.boolean :is_paid

      t.timestamps
    end
  end
end

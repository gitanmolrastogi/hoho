class AddPriceToBus < ActiveRecord::Migration[5.0]
  def change
    add_column :buses, :price, :integer
  end
end

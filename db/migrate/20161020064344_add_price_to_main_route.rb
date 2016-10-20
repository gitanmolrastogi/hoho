class AddPriceToMainRoute < ActiveRecord::Migration[5.0]
  def change
    add_column :main_routes, :price, :integer
  end
end

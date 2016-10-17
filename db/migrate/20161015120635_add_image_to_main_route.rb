class AddImageToMainRoute < ActiveRecord::Migration[5.0]
  def change
    add_column :main_routes, :image, :string
  end
end

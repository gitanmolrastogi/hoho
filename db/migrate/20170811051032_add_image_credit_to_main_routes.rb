class AddImageCreditToMainRoutes < ActiveRecord::Migration[5.0]
  def change
  	add_column :main_routes, :image_credit, :string
  end
end

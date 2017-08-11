class AddImageCreditToCities < ActiveRecord::Migration[5.0]
  def change
  	add_column :cities, :image_credit, :string
  end
end

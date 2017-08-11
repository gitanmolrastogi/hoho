class AddImageCreditToCategories < ActiveRecord::Migration[5.0]
  def change
  	add_column :categories, :image_credit, :string
  end
end

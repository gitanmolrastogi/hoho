class AddImageCreditToHomePageImages < ActiveRecord::Migration[5.0]
  def change
  	add_column :home_page_images, :image_credit, :string
  end
end

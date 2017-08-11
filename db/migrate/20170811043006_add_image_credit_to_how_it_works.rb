class AddImageCreditToHowItWorks < ActiveRecord::Migration[5.0]
  def change
  	add_column :how_it_works, :image_credit, :string
  end
end

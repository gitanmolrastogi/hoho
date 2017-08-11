class AddImageCreditToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :image_credit, :string
  end
end

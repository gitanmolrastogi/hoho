class CreateHomePageImages < ActiveRecord::Migration[5.0]
  def change
    create_table :home_page_images do |t|
      t.string :image
      t.string :status

      t.timestamps
    end
  end
end

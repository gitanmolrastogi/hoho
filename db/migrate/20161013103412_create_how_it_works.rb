class CreateHowItWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :how_it_works do |t|
      t.string :title
      t.string :sub_title
      t.string :content
      t.string :image
      t.string :icon

      t.timestamps
    end
  end
end

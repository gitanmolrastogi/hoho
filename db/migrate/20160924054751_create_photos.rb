class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :image
      t.boolean :status
      t.string :imageable_id
      t.string :imageable_type
      t.timestamps
    end
      add_index :photos, [:imageable_type, :imageable_id]
  end
end

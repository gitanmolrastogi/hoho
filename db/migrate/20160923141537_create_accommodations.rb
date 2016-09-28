class CreateAccommodations < ActiveRecord::Migration[5.0]
  def change
    create_table :accommodations do |t|
      t.string :title
      t.text :information
      t.string :redirection_link
      t.string :where_we_stay
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end

class CreateCompanyLogos < ActiveRecord::Migration[5.0]
  def change
    create_table :company_logos do |t|
      t.string :image

      t.timestamps
    end
  end
end

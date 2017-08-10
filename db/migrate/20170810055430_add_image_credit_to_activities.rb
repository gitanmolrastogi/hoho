class AddImageCreditToActivities < ActiveRecord::Migration[5.0]
  def change
  	add_column :activities, :image_credit, :string
  end
end

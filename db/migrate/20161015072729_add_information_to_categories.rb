class AddInformationToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :info, :text
  end
end

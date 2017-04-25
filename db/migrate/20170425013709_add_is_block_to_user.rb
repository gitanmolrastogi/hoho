class AddIsBlockToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_block, :boolean,default: true
  end
end

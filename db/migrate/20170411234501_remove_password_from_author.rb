class RemovePasswordFromAuthor < ActiveRecord::Migration[5.0]
  def change
    remove_column :authors, :password, :string
  end
end

class RemovePicFromAuthors < ActiveRecord::Migration[5.0]
  def change
    remove_column :authors, :pic, :string
  end
end

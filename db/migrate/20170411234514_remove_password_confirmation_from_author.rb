class RemovePasswordConfirmationFromAuthor < ActiveRecord::Migration[5.0]
  def change
    remove_column :authors, :password_confirmation, :string
  end
end

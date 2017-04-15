class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :pic
      t.text :about
      t.string :email
      t.string :password
      t.string :password_confirmation

      t.timestamps
    end
  end
end

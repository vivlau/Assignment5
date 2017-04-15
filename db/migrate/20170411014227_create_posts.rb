class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :likes
      t.string :image
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end

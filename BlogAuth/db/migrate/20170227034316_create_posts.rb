class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :body, null: false
      t.string :title, null: false
      t.string :author_id, null: false

      t.timestamps null: false
    end
    add_index :posts, :author_id
  end
end

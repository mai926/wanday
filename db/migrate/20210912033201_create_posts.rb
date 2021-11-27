class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :caption,               null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
    # add_index :posts, :caption
  end
end

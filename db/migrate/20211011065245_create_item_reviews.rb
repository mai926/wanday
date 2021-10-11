class CreateItemReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :item_reviews do |t|
      t.string :title,               null: false
      t.text :comment,               null: false
      t.float :rate
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end

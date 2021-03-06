class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :nickname,               null: false
      t.string :account_id,               null: false, unique: true
      t.date :birthday,               null: false
      t.text :introduction
      t.references :user
      t.timestamps
    end
    add_index :accounts, :nickname
  end
end

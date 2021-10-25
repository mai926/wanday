class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :dog_breed
      t.date :birthday
      t.references :user
      t.timestamps
    end
  end
end

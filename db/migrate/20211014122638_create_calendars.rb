class CreateCalendars < ActiveRecord::Migration[6.0]
  def change
    create_table :calendars do |t|
      t.string :event,       null: false
      t.text :text,          null: false
      t.date :start_time,    null: false
      t.references :user,    foreign_key: true
      t.timestamps
    end
  end
end

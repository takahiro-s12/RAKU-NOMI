class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :group_id
      t.string :name, null: false
      t.string :venue_name
      t.string :venue_address
      t.date :date, null: false
      t.time :start_time
      t.time :finish_time
      t.integer :cost
      t.string :site_url
      t.string :comment

      t.timestamps
    end
  end
end

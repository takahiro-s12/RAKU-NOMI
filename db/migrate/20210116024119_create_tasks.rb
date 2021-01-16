class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :task, null: false
      t.date :limit_date, null: false
      t.boolean :status , default: false, null:false

      t.timestamps
    end
  end
end

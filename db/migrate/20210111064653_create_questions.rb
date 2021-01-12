class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :group_id
      t.date :first_candidate
      t.date :second_candidate
      t.date :final_candidate

      t.timestamps
    end
  end
end

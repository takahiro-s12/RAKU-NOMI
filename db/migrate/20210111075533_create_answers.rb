class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :group_id
      t.boolean :first_candidate, default: false
      t.boolean :second_candidate, default: false
      t.boolean :final_candidate, default: false

      t.timestamps
    end
  end
end

class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :user, foreign_key: true
      t.references :question, foreign_key: true
      t.boolean :first_candidate
      t.boolean :scond_candidate
      t.boolean :final_candidate
      t.boolean :status

      t.timestamps
    end
  end
end

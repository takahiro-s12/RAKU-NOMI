class ChangeStatusOfAnswers < ActiveRecord::Migration[5.2]
  def up
    change_column :answers, :first_candidate, :boolean, default: false
    change_column :answers, :scond_candidate, :boolean, default: false
    change_column :answers, :final_candidate, :boolean, default: false
    change_column :answers, :status, :boolean, default: false
  end

  def down
    change_column :answers, :first_candidate, :boolean
    change_column :answers, :scond_candidate, :boolean
    change_column :answers, :final_candidate, :boolean
    change_column :answers, :status, :boolean
  end
end

class RenameScondCandidateColumnToAnswers < ActiveRecord::Migration[5.2]
  def change
    rename_column :answers, :scond_candidate, :second_candidate
  end
end

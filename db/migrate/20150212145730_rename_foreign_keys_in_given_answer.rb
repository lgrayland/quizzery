class RenameForeignKeysInGivenAnswer < ActiveRecord::Migration
  def change
    rename_column :given_answers, :question_id, :quiz_question_id
    rename_column :given_answers, :answer_choices_id, :answer_choice_id 
  end
end

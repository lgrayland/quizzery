class CreateGivenAnswers < ActiveRecord::Migration
  def change
    create_table :given_answers do |t|
      t.integer :participation_id
      t.integer :question_id
      t.integer :answer_choices_id

      t.timestamps
    end
  end
end

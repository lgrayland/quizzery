class AddQuestionImageToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :question_image, :string
  end
end

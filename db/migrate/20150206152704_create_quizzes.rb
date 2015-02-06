class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.integer :owner_id
      t.text :name
      t.string :status

      t.timestamps
    end
  end
end

class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.integer :type_id
      t.integer :theme_id

      t.timestamps
    end
  end
end

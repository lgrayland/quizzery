class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :quiz_id
      t.integer :creator_id
      t.string :name

      t.timestamps
    end
  end
end

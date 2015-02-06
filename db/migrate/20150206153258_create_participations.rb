class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.integer :quiz_id
      t.integer :user_id
      t.integer :game_id

      t.timestamps
    end
  end
end

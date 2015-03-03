class RemoveQuizIdFromParticipations < ActiveRecord::Migration
  def change
    remove_column :participations, :quiz_id, :integer
  end
end

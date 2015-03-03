class AddGameIdToGivenAnswer < ActiveRecord::Migration
  def change
    add_column :given_answers, :game_id, :integer
  end
end

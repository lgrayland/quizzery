class AddStatusToGames < ActiveRecord::Migration
  def change
    add_column :games, :status, :string
  end
end

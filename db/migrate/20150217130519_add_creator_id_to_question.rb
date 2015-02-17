class AddCreatorIdToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :creator_id, :integer
  end
end

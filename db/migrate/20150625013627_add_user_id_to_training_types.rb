class AddUserIdToTrainingTypes < ActiveRecord::Migration
  def change
    add_column :training_types, :user_id, :integer
  end
end

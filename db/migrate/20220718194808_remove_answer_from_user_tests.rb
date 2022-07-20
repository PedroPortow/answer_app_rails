class RemoveAnswerFromUserTests < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_tests, :answer_id
  end
end

class AddQuestionToUserTestAnswers < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_test_answers, :question, foreign_key: true
  end
end

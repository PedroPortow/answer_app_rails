class CreateUserTestAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :user_test_answers do |t|
      t.references :user_test, foreign_key: true
      t.references :answer, foreign_key: true

      t.timestamps
    end
  end
end
